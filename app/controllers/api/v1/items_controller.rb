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

      def create
        @item = current_user.items.new(item_params)

        if @item.save
          render json: @item.as_json
        else
          render json: { status: :unprocessable_entity, data: @item.errors.messages }
        end
      end

      private

      def item_params
        params.require(:item).permit!(:name, :description)
      end
    end
  end
end
