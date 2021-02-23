# frozen_string_literal: true

module Pagination
  extend ActiveSupport::Concern

  def order
    params[:order] || 'updated_at DESC'
  end

  def page
    params[:page] || 1
  end

  def per_page
    params[:per_page] || 24
  end

  def query
    params.require(:q).permit! if params[:q].present?
  end

  private :page, :per_page, :query
end
