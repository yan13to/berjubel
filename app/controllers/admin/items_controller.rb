# frozen_string_literal: true

module Admin
  # ItemsController
  class ItemsController < Admin::ApplicationController
    include Pagination

    def index
      @search = Item.ransack(query)
      @items = @search.result(distinct: true)
                      .includes(:store)
                      .page(page)
                      .per(per_page)
                      .order(order)

      respond_to do |format|
        format.html
      end
    end
  end
end
