# frozen_string_literal: true

# ProfilesController
class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile || current_user.build_profile
  end
end
