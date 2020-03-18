class Api::V1::ItemsController < Api::V1::ApplicationController
  def index
    @items = Item.paginate(page: params[:p], per_page: (params[:pp] || 25))
  end
end
