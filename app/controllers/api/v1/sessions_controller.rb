# frozen_string_literal: true

module Api
  module V1
    # SessionsController
    class SessionsController < DeviseTokenAuth::SessionsController
      skip_before_action :verify_authenticity_token
    end
  end
end
