# frozen_string_literal: true

# I18n locale
module I18nLocale
  extend ActiveSupport::Concern

  included do
    before_action :switch_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def switch_locale
    I18n.locale = locale
  end

  def locale
    locale_from_user_setting || locale_from_params || I18n.default_locale
  end

  def locale_from_user_setting
    current_user&.setting.try(:locale)
  end

  # locale from params eg: https://example.com?locale=id
  def locale_from_params
    parsed_locale = params[:locale]

    return unless I18n.available_locales.map(&:to_s).include?(parsed_locale)

    parsed_locale
  end

  # locale from domain eg: https://example.id
  def locale_from_top_domain
    parsed_locale = request.host.split('.').last

    return unless I18n.available_locales.map(&:to_s).include?(parsed_locale)

    parsed_locale
  end

  # locale from subdomain eg: https://id.example.com
  def locale_from_subdomain
    parsed_locale = request.subdomains.first

    return unless I18n.available_locales.map(&:to_s).include?(parsed_locale)

    parsed_locale
  end

  # will require to scope in routes.rb
  def locale_from_route; end

  def locale_from_http_header
    parsed_locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/)[0]

    return unless I18n.available_locales.map(&:to_s).include?(parsed_locale)

    parsed_locale
  end

  # based on ip address, require gem geocoder
  def locale_from_location
    country_location = request.location.country_code

    return unless country_location

    country_location.downcase
  end
end
