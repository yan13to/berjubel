# frozen_string_literal: true

# ItemsController
class ItemsController < ApplicationController
  include Pagination

  before_action :authenticate_user!

  def index
    @items = Item.ransack(query)
                 .result(distinct: true)
                 .order(order)
                 .page(page)
                 .per_page(per_page)
  end

  def show
    @item = Item.find(params[:id])
  end
end
