class HomeController < ApplicationController
  def index
    if !session[:email].nil? then redirect_to mac_index_path end
  end
  
  def email
  end
  
  def emailsave
    flash[:notice] = "Successfully saved your email address"
    session[:email] = params[:email][:address].downcase
    return redirect_to mac_index_path
  end
end
