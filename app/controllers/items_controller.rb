class ItemsController < ApplicationController
  def index
    @items = Item.paginate(page: 1, per_page: 5)
  end
end
