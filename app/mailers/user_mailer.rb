class UserMailer < ActionMailer::Base
  default from: "do-not-reply@example.com"
  
  def contact_email(contact)
    @contact = contact
    puts Rails.application.secrets.owner_email
    puts @contact.email
    mail(to: Rails.application.secrets.owner_email, from: @contact.email, :subject => "Website Contact")
    
  end
end
