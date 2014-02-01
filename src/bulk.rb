
require './bulk_email'


unless ARGV.length == 6
  puts 'Invalid parameters.'
  puts 'Usage: ruby bulk.rb server.csv to.txt emailsender subject content.html isHtml\n'
  puts "Example: ruby bulk.rb server.csv to.txt 'sender@email.com' 'Newsletter January 2014' content.txt true\n"
  exit
end

lines = IO.readlines(ARGV[0])
values = lines[0].split(',').collect(&:strip)
smtp_server = values[0]
port = values[1]
mail_user = values[2]
mail_password = values[3]

email_content = File.read(ARGV[4])
email = BulkEmail.new(smtp_server,port,mail_user,mail_password)

receivers = IO.readlines(ARGV[1])
for receiver in receivers do
  email.send_email(ARGV[2],receiver,ARGV[3],email_content,ARGV[5])
  puts(receiver)
end
puts('done....')



#puts(lines[0])
#puts(values)
#puts(values.length)
#puts(ARGV[0])
#puts(ARGV[1])
#puts(ARGV[2])
#puts(ARGV[3])
#puts(ARGV[4])



#email = BulkEmail.new('localhost',25,'','')
#email.send_email('agusk@sirsakemail.local','aku@sirsakemail.local','test email',email_content,true)

