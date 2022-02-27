# frozen_string_literal: true

# ItemsController
class ItemsController < ApplicationController
  # include Authentication
  include Pagination

  def index
    @search = Item.active.ransack(query)
    load_items

    respond_to do |format|
      format.html
    end
  end

  def show
    @item = Item.active.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def following
    @search = Item.active.ransack(query)
    load_items

    respond_to do |format|
      format.html { render :index }
    end
  end

  def me
    @search = Item.active.ransack(user_id_eq: current_user.id)
    load_items

    respond_to do |format|
      format.html { render :index }
    end
  end

  private

  def load_items
    @items = @search.result(distinct: true)
                    .includes(:store)
                    .page(page)
                    .per(per_page)
                    .order(order)
  end
end
