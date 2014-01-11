
require './bulk_email'


unless ARGV.length == 6
  puts 'Invalid parameters.'
  puts 'Usage: ruby bulk.rb to.csv from subject content.html isHtml\n'
  puts "Example: ruby bulk.rb server.csv to.txt 'sender@email.com' 'Newsletter January 2014' content.txt true\n"
  exit
end

receivers = IO.readlines('to.txt')
puts(receivers)
lines = IO.readlines('server.csv')
values = lines[0].split(',').collect(&:strip)
puts(lines[0])
puts(values)
puts(values.length)
#puts(ARGV[0])
#puts(ARGV[1])
#puts(ARGV[2])
#puts(ARGV[3])
#puts(ARGV[4])



#email = BulkEmail.new('localhost',25,'','')
#email.send_email('agusk@sirsakemail.local','aku@sirsakemail.local','test email','this is email body',false)

