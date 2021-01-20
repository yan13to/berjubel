# frozen_string_literal: true

module Api
  module V1
    # RegistrationsController
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      skip_before_action :verify_authenticity_token

      protected

      def sign_up_params
        params.require(:user).permit(
          :email,
          :password,
          :password_confirmation,
          :accept
        )
      end
    end
  end
end
