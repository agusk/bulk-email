###################################################
# copyright 2014 Agus Kurniawan
# blog: http://blog.aguskurniawan.net
# email: agusk2007@gmail.com
###################################################

require 'net/smtp'

class BulkEmail
  def initialize(smtpserver,port,username,password)
    @svr = smtpserver
    @port = port
    @usr = username
    @pwd = password
  end

  def send_email(from,to,subject,body,ishtml)
    if ishtml
      send_email_html(from,to,subject,body)
    else
      send_email_plaintext(from,to,subject,body)
    end
  end

  private
  def construct_message(from,to,subject,body,ishtml)
    puts('constructing email message')
    if ishtml
      message = <<MESSAGE_END
From: ##1
To: ##2
MIME-Version: 1.0
Content-type: text/html
Subject: ##3

##4
MESSAGE_END

    else

      message = <<MESSAGE_END
From: ##1
To: ##2
MIME-Version: 1.0
Subject: ##3

##4
MESSAGE_END

    end

    message.gsub! "##1",from
    message.gsub! "##2",to
    message.gsub! "##3",subject
    message.gsub! "##4",body

    message
  end
  def send_email_plaintext(from,to,subject,body)
    puts('send email plaintext')

    message = construct_message(from,to,subject,body,false)
    send(from,to,message)

    puts('sent email')
  end
  def send_email_html(from,to,subject,body)
    puts('send email html')

    message = construct_message(from,to,subject,body,true)
    send(from,to,message)

    puts('sent email')

  end
  def send(from,to,message)
    if @usr.empty?
      smtp = Net::SMTP.new @svr, @port
      smtp.start(Socket.gethostname) do |server|
        server.send_message message, from, to
      end

    else
      smtp = Net::SMTP.new @svr, @port
      smtp.start(Socket.gethostname,@usr,@pwd,:login) do |server|
        server.send_message message, from, to
      end
    end
  end

end


#test send email
email = BulkEmail.new('localhost',25,'','')
email.send_email('agusk@sirsakemail.local','aku@sirsakemail.local','test email','this is email body',false)

