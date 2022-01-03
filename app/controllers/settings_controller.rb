# frozen_string_literal: true

# SettingsController
class SettingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @setting = current_user.build_setting

    respond_to do |format|
      format.html
    end
  end

  def edit
    @setting = current_user.setting

    respond_to do |format|
      format.html
    end
  end

  def show
    @setting = current_user.setting

    respond_to do |format|
      format.html { redirect_to new_setting_path and return unless @setting }
    end
  end

  def create
    @setting = current_user.build_setting(setting_params)

    respond_to do |format|
      if @setting.save
        format.html { redirect_back fallback_location: setting_path, notice: I18n.t('settings.create.success') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @setting = current_user.setting

    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_back fallback_location: setting_path, notice: I18n.t('settings.update.success') }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def setting_params
    params.require(:user_setting).permit(:currency, :listing_mode, :locale)
  end
end
