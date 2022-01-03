# frozen_string_literal: true

module Admin
  # PropertiesController
  class PropertiesController < Admin::ApplicationController
    include Pagination

    def index
      @search = Property.ransack(query)
      @properties = @search.result(distinct: true)
                           .order(order)
                           .page(page)
                           .per(per_page)

      respond_to do |format|
        format.html
      end
    end
  end
end
