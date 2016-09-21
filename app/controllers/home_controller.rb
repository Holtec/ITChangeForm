class HomeController < ApplicationController
  def index
  end
  
  def email
  end
  
  def emailsave
    flash[:notice] = "Successfully saved your email address"
    session[:email] = params[:email][:address].downcase
    return redirect_to root_path
  end
end
