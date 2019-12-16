class ItemsController < ApplicationController
  def index
    @items = Item.limit(5)
  end
end
