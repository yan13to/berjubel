# frozen_string_literal: true

# Authentication
module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
  end
end
