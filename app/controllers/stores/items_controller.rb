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

      @search = @store.items.ransack(query)
      @items = @search.result(distinct: true)
                      .order(order)
                      .page(page)
                      .per(per_page)
    end

    def show
      @item = @store.items.find(params[:id])

      render 'items/show'
    end

    def new
      @item = @store.items.new

      render partial: 'stores/items/form' if request.xhr?
    end

    def create
      @item = @store.items.new(item_params)

      if @item.save
        redirect_to store_path(@store), notice: t('items.create.success')
      else
        render partial: 'stores/items/form', status: :unprocessable_entity and return if request.xhr?

        render :new
      end
    end

    def edit
      @item = @store.items.find(params[:id])

      render partial: 'stores/items/form' if request.xhr?
    end

    def update
      @item = @store.items.find(params[:id])

      if @item.update(item_params)
        if request.xhr?
          render partial: 'stores/items/form'
        else
          redirect_to store_path(@store), notice: t('items.update.success')
        end
      elsif request.xhr?
        render partial: 'stores/items/form'
      else
        render :edit
      end
    end

    def destroy
      @item = @store.items.find(params[:id])

      notice = @item.destroy ? t('items.destroy.success') : t('items.destroy.failed')

      redirect_to store_path(@store), notice: notice
    end

    private

    def item_params
      params.require(:item).permit(
        :name,
        :description,
        :category_id,
        :label_id,
        item_labels_attributes: %i[id label_id _destroy],
        photos: []
      )
    end

    def find_store
      @store = current_user.stores.where(id: params[:store_id]).first

      respond_to do |format|
        format.html { redirect_to stores_path and return unless @store }
      end
    end
  end
end
