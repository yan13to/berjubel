# frozen_string_literal: true

module Items
  # PhotosController
  class PhotosController < ApplicationController
    include Pagination

    before_action :find_item

    def index
      @photos = @item.photos
                     .ransack(query)
                     .result(distinct: true)
                     .order(order)
                     .page(page)
                     .per_page(per_page)

      render partial: 'carousel' and return if request.xhr?
    end

    private

    def find_item
      @item = Item.where(id: params[:item_id]).first

      redirect_to items_path and return unless @item
    end
  end
end
