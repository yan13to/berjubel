class SessionsController < ApplicationController
  def index
    respond_to do |format|
      format.html {redirect_to(login_url)}
    end
  end

  def new
  end

  def create
    logout_keeping_session!
    user = User.authenticate(params[:username], params[:password])
    if user
      self.current_user = user
      flash.now[:notice] = "Login successfull"
      redirect_back_or_default("/")
    else
      note_failed_signin
      @username = params[:username]
      @remember_me = params[:remember_me]
      flash.now[:notice] = "Invalid username or password!"
      render :action => "new"
    end
  end

  def destroy
    logout_killing_session!
    flash.now[:notice] = "You have been logged out."
    redirect_back_or_default(dashboard_index_url)
  end

protected
  def note_failed_signin
    flash[:notice] = "Couldn't log you in as '#{params[:username]}'"
    logger.warn "Failed login for '#{params[:username]}' from #{request.remote_ip} at #{Time.now.utc}"
  end

end
