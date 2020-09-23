class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  skip_before_action :verify_authenticity_token
end
