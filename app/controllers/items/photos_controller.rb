# frozen_string_literal: true

module Items
  # PhotosController
  class PhotosController < ApplicationController
    before_action :find_item

    def index
      @photos = @item.photos
    end

    private

    def find_item
      @item = Item.where(id: params[:item_id]).first

      redirect_to items_path and return unless @item
    end
  end
end
