# frozen_string_literal: true

module Api
  module V1
    # ItemsController
    class ItemsController < Api::V1::ApplicationController
      include Pagination

      def index
        @items = Item.ransack(query)
                     .result(distinct: true)
                     .order(order)
                     .page(page)
                     .per_page(per_page)
      end
    end
  end
end
