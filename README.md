## bulk-email

Sending bulk emails using Ruby.

## Usage

You send bulk email as follows
<ol>
<li>Change value of smtp server on file server.csv</li>
<li>Add a number of recipients on file to.txt</li>
<li>Modified a content of email on file content.txt</li>
</ol>
You can execute the program with this syntax.

    ruby bulk.rb server.csv to.txt 'sender@email.com' 'subject email' content.txt true

