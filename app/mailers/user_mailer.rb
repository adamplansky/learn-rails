class UserMailer < ActionMailer::Base
  default from: "do-not-reply@example.com"
  
  def contact_email(contact)
    @contact = contact
    Rails.logger.debug "Debug:  #{Rails.application.secrets.owner_email}" 
    Rails.logger.debug "Debug:  XXXXXXXXXX"
    Rails.logger.debug "Debug:  XXXXXXXXXX"
    Rails.logger.debug "Debug:  XXXXXXXXXX" 
    mail(to: Rails.application.secrets.owner_email, from: @contact.email, :subject => "Website Contact")
    
  end
end
