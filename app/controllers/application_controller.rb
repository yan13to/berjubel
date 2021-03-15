# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  include I18nLocale

  helper_method :previous_or_current_path

  before_action :set_from_location

  protected

  def set_from_location
    cookies[:from] = params[:from] if params[:from].present?
  end

  def previous_or_current_path(path)
    previous_path = cookies[:from]
    cookies.delete :from
    previous_path.present? ? previous_path : path
  end
end
