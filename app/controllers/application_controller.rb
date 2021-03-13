# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  # layout(proc { |c| c.request.xhr? ? false : 'application' })

  include I18nLocale
end
