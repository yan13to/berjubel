# frozen_string_literal: true

# Pagination
module Pagination
  extend ActiveSupport::Concern

  included do
    helper_method :available_per_pages, :per_page, :query, :url_for_pagination
  end

  def available_per_pages
    [25, 50, 100, 150]
  end

  def order
    params[:order] || 'updated_at DESC'
  end

  def page
    params[:page] || 1
  end

  def per_page
    params[:per_page] || 25
  end

  def query
    params.require(:q).permit! if params[:q].present?
  end

  def url_for_pagination(perp)
    permitted_params = params.permit!
    permitted_params[:per_page] = perp
    permitted_params
  end

  private :page, :per_page, :query
end
