class UsersController < ApplicationController
  before_filter :check_if_user_logged_in

  layout "simple"

  def new
    @user = User.new
  end

  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_back_or_default("/dashboard")
    else
      render :action => "new"
    end
  end

  def forgot_password
    
  end

end
