# frozen_string_literal: true

# ProfilesController
class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile || current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to profile_path, notice: I18n.t('profiles.create.success')
    else
      render :show
    end
  end

  def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      redirect_to profile_path, notice: I18n.t('profiles.update.success')
    else
      render :show
    end
  end

  private

  def profile_params
    params.require(:user_profile).permit(:first_name, :last_name)
  end
end
