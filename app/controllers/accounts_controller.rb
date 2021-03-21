# frozen_string_literal: true

# AccountsController
class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @account = current_user
  end

  def edit
    @account = current_user
  end

  def update
    @account = current_user

    if @account.update(user_params)
      redirect_to account_path, notice: t('accounts.update.success')
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
