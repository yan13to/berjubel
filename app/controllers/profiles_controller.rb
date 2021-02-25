# frozen_string_literal: true

# ProfilesController
class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = current_user.build_profile
  end

  def edit
    @profile = current_user.profile
  end

  def show
    @profile = current_user.profile

    redirect_to new_profile_path and return unless @profile
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to profile_path, notice: I18n.t('profiles.create.success')
    else
      render :new
    end
  end

  def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      redirect_to profile_path, notice: I18n.t('profiles.update.success')
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user_profile).permit(:first_name, :last_name)
  end
end
