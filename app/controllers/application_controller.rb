# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  before_action :switch_locale

  protected

  def switch_locale
    I18n.locale = locale
  end

  def locale
    locale_from_params || current_user&.setting.try(:locale) || I18n.default_locale
  end

  def locale_from_params
    return unless I18n.available_locales.map(&:to_s).include?(params[:locale])

    params[:locale]
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
