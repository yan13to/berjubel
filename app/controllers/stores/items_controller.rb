# frozen_string_literal: true

module Stores
  # ItemsController
  class ItemsController < ApplicationController
    include Pagination

    before_action :authenticate_user!
    before_action :find_store, except: :index

    def index
      @store = Store.where(id: params[:store_id]).first

      redirect_to stores_path and return unless @store

      @items = @store.items
                     .ransack(query)
                     .result(distinct: true)
                     .order(order)
                     .page(page)
                     .per_page(per_page)
    end

    def show
      @item = @store.items.find(params[:id])
    end

    def new
      @item = @store.items.new
    end

    def create
      @item = @store.items.new(item_params)

      if @item.save
        redirect_to store_items_path(@store), notice: t('items.create.success')
      else
        render :new
      end
    end

    def edit
      @item = @store.items.find(params[:id])
    end

    def update
      @item = @store.items.find(params[:id])

      if @item.update(item_params)
        redirect_to store_items_path(@store), notice: t('items.update.success')
      else
        render :edit
      end
    end

    def destroy
      @item = @store.items.find(params[:id])

      if @item.destroy
        flash.now[:notice] = t('items.destroy.success')
      else
        flash.now[:notice] = t('items.destroy.failed')
      end

      redirect_to store_path(@store)
    end

    private

    def item_params
      params.require(:item).permit(:name)
    end

    def find_store
      @store = current_user.stores.where(id: params[:store_id]).first

      redirect_to stores_path and return unless @store
    end
  end
end
