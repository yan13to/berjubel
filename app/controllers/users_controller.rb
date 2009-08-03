class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_back_or_default(dashboard_index_url)
    else
      render :action => "new"
    end
  end
end
