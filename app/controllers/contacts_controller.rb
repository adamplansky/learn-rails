class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    #Rails.logger.debug "DEBUG: #{@contact.name}"
    @contact = Contact.new(secure_param)
    Rails.logger.debug "DEBUG: #{@contact.name}"
    if @contact.valid?
      @contact.update_spreadsheet
      #TODO send message
      
      flash[:notice] = "Message sent from #{@contact.name}"
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  def secure_param
    params.require(:contact).permit(:name, :email, :content)
  end
end