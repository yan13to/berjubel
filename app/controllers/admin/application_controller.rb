# frozen_string_literal: true

module Admin
  class ApplicationController < ActionController::Base
    include I18nLocale

    layout 'admin'
  end
end
