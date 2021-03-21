# frozen_string_literal: true

module Api
  module V1
    # ApplicationController
    class ApplicationController < ActionController::API
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_api_v1_user!

      alias current_user current_api_v1_user
    end
  end
end
