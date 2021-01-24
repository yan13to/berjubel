# frozen_string_literal: true

module Api
  module V1
    module Users
      # SessionsController
      class SessionsController < DeviseTokenAuth::SessionsController
        skip_before_action :verify_authenticity_token
      end
    end
  end
end
