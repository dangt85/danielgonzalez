class ContactMailer < ActionMailer::Base
  default :from => "dangt85@heroku.com"
 
  def notification(contact)
    @contact = contact
    mail(:to => "dangt85@gmail.com", :subject => "Someone wrote on dangt85.heroku.com")
  end
  
  def confirmation(contact)
    @contact = contact
    mail(:to => "#{@contact.name} <#{@contact.email}>",
      :subject => "Thank you for contacting me at dangt85.heroku.com")
  end
end
