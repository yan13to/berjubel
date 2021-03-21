# frozen_string_literal: true

# SettingsController
class SettingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @setting = current_user.build_setting
  end

  def edit
    @setting = current_user.setting
  end

  def show
    @setting = current_user.setting

    redirect_to new_setting_path and return unless @setting
  end

  def create
    @setting = current_user.build_setting(setting_params)

    if @setting.save
      redirect_back fallback_location: setting_path, notice: I18n.t('settings.create.success')
    else
      render :new
    end
  end

  def update
    @setting = current_user.setting

    if @setting.update(setting_params)
      redirect_back fallback_location: setting_path, notice: I18n.t('settings.update.success')
    else
      render :edit
    end
  end

  private

  def setting_params
    params.require(:user_setting).permit(:currency, :listing_mode, :locale)
  end
end
