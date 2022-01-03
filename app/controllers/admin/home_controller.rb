# frozen_string_literal: true

module Admin
  # HomeController
  class HomeController < Admin::ApplicationController
    def index
      respond_to do |format|
        format.html
      end
    end
  end
end
