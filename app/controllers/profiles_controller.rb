# frozen_string_literal: true

# ProfilesController
class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = current_user.build_profile

    respond_to do |format|
      format.html
    end
  end

  def edit
    @profile = current_user.profile

    respond_to do |format|
      format.html
    end
  end

  def show
    @profile = current_user.profile

    respond_to do |format|
      format.html { redirect_to new_profile_path and return unless @profile }
    end
  end

  def create
    @profile = current_user.build_profile(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_path, notice: I18n.t('profiles.create.success') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @profile = current_user.profile

    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_path, notice: I18n.t('profiles.update.success') }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :avatar)
  end
end
