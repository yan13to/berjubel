# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  around_action :switch_locale

  protected

  def switch_locale(&action)
    I18n.with_locale(locale, &action)
  end

  def locale
    params[:locale] || current_user&.setting.try(:locale) || I18n.default_locale
  end
end
