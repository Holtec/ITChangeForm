class MacController < ApplicationController
  before_filter :require_email
  def index
  end

  def new
    @request = Mac.new
  end
  
  def personal
    @maccount = Mac.where(:requester => session[:email]).count
  end
  
  def create
    @mac = Mac.new(mac_params)
    @mac[:requester] = session[:email]
    @mac[:status] = "new"
    if @mac.save
      Newmacemail.new_request_email(session[:email], @mac.division, @mac.what, @mac.why, @mac.when, @mac.how, @mac.success, @mac.rollback, @mac.id).deliver_now
      flash[:notice] = "Successfully added MAC ID: #{@mac.id}"
      return redirect_to mac_index_path
    else
      flash[:alert] = "Failed to generate new MAC"
      return redirect_to new_mac_path
    end
  end
  
  def details
    @mac = Mac.find_by_id(params[:id])
    @comments = @mac.comment.all
  end
  
  def approve
    @mac = Mac.find_by_id(params[:id])
    @mac.status = "approved"
    if @mac.save
      Newmacemail.approve_request_email(session[:email], @mac.id).deliver_now
      flash[:notice] = "Successfully approved MAC ID: #{@mac.id}"
      return redirect_to  mac_details_path(params[:id])
    else
      flash[:alert] = "Failed to update MAC"
      return redirect_to  mac_details_path(params[:id])
    end
  end
  
  def deny
    @mac = Mac.find_by_id(params[:id])
    @mac.status = "denied"
    @mac.reason = params[:mac][:reason]
    if @mac.save
      Newmacemail.deny_request_email(session[:email], @mac.id, @mac.reason).deliver_now
      flash[:notice] = "Successfully denied MAC ID: #{@mac.id}"
      return redirect_to  mac_details_path(params[:id])
    else
      flash[:alert] = "Failed to update MAC"
      return redirect_to  mac_details_path(params[:id])
    end
  end
  
  def succeeded
    @mac = Mac.find_by_id(params[:id])
    @mac.status = "succeeded"
    @mac.successreason = params[:mac][:successreason]
    if @mac.save
      Newmacemail.succeeded_request_email(session[:email], @mac.id, @mac.successreason).deliver_now
      flash[:notice] = "MAC ID: #{@mac.id} SUCCEEDED"
      return redirect_to  mac_details_path(params[:id])
    else
      flash[:alert] = "Failed to update MAC"
      return redirect_to  mac_details_path(params[:id])
    end
    
  end
  
  def failed
    @mac = Mac.find_by_id(params[:id])
    @mac.status = "failed"
    @mac.failreason = params[:mac][:failreason]
    if @mac.save
      Newmacemail.failed_request_email(session[:email], @mac.id, @mac.failreason).deliver_now
      flash[:notice] = "MAC ID: #{@mac.id} FAILED to implement"
      return redirect_to  mac_details_path(params[:id])
    else
      flash[:alert] = "Failed to update MAC"
      return redirect_to  mac_details_path(params[:id])
    end
    
  end
  
  def createcomment
    @mac = Mac.find(params[:id])
    @comment = @mac.comment.create(comment_params)
    if @comment.save
      Newmacemail.new_comment_email(session[:email], @mac.id, @comment.content).deliver_now
      flash[:notice] = "Successfully added comment to MAC ID: #{@mac.id}"
      return redirect_to mac_details_path(params[:id])
    else
      flash[:alert] = "Failed to add your comment"
      return redirect_to mac_details_path(params[:id])
    end
  end
  
  def edit
    @mac = Mac.find(params[:id])
    if @mac.requester != session[:email]
      flash[:alert] = "You do not have permissions to edit this MAC"
      return redirect_to root_path
    end
  end
  
  def change
    @mac = Mac.find(params[:id])
    if @mac.update_attributes(mac_params)
      Newmacemail.edit_request_email(session[:email], @mac.division, @mac.what, @mac.why, @mac.when, @mac.how, @mac.success, @mac.rollback, @mac.id).deliver_now
      flash[:success] = "MAC Updated"
      return redirect_to mac_details_path(params[:id])
    else
      flash[:alert] = "Failed to update MAC"
      render 'edit'
end
  end
  
  def delete
  end
  
  def api
    @macs = Mac.all.pluck(:id, :division, :what, :when, :status, :requester)
    @data = {"data": @macs}
    return render :json => @data.to_json
  end
  
  def personal_api
    @macs = Mac.where(:requester => params[:email]).pluck(:id, :division, :what, :when, :status)
    @data = {"data": @macs}
    return render :json => @data.to_json
  end
  
  private 
  
  def require_email
    if !session[:email] then redirect_to add_email_path end
  end
  
  def mac_params
    params.require(:mac).permit(:division, :what, :why, :when, :how, :success, :rollback, :requester, :status, :successreason, :failreason, :reason)
  end
    
  def comment_params
    params.require(:comment).permit(:saidby, :content)
  end
  
end
