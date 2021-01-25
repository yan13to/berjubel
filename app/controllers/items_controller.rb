# frozen_string_literal: true

class ItemsController < ApplicationController
  include Pagination

  def index
    @items = Item.ransack(query)
                 .result(distinct: true)
                 .order(order)
                 .page(page)
                 .per_page(per_page)
  end
end
