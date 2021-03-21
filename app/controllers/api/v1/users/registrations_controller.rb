# frozen_string_literal: true

module Api
  module V1
    module Users
      # RegistrationsController
      class RegistrationsController < DeviseTokenAuth::RegistrationsController
        skip_before_action :verify_authenticity_token

        protected

        def build_resource
          @resource            = resource_class.new(sign_up_params)
          @resource.provider   = provider
          @resource.from_api   = true

          if resource_class.case_insensitive_keys.include?(:email)
            @resource.email = sign_up_params[:email].try(:downcase)
          else
            @resource.email = sign_up_params[:email]
          end
        end

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
end
