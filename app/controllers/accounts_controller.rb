# frozen_string_literal: true

# AccountsController
class AccountsController < ApplicationController
  include Authentication

  def show
    @account = current_user

    respond_to do |format|
      format.html
    end
  end

  def edit
    @account = current_user

    respond_to do |format|
      format.html
    end
  end

  def update
    @account = current_user

    respond_to do |format|
      if @account.update(user_params)
        format.html { redirect_to account_path, notice: t('accounts.update.success') }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
