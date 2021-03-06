class VisitorsController < ApplicationController
  def new
    @visitor = Visitor.new
    # render 'visitors/new'
  end
  
  def create
    @visitor = Visitor.new(secure_params)
    Rails.logger.debug "DEBUG: visitor = #{@visitor}"
    if @visitor.valid?
      @visitor.subscribe
      flash[:notice] = "Signed up #{@visitor.email}"
      redirect_to root_path
    else
      render :new
    end
    
  end
  
  private
  
  def secure_params
    params.require(:visitor).permit(:email)
  end
  
end