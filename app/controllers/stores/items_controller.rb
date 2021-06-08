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

      render 'items/show'
    end

    def new
      @item = @store.items.new
      build_related_fields

      render partial: 'stores/items/form' if request.xhr?
    end

    def create
      @item = @store.items.new(item_params)
      build_related_fields

      if @item.save
        redirect_to store_path(@store), notice: t('items.create.success')
      else
        render partial: 'stores/items/form', status: :unprocessable_entity and return if request.xhr?

        render :new
      end
    end

    def edit
      @item = @store.items.find(params[:id])
      build_related_fields

      render partial: 'stores/items/form' if request.xhr?
    end

    def update
      @item = @store.items.find(params[:id])
      build_related_fields

      if @item.update(item_params)
        if request.xhr?
          render partial: 'stores/items/form'
        else
          redirect_to store_path(@store), notice: t('items.update.success')
        end
      else
        if request.xhr?
          render partial: 'stores/items/form'
        else
          render :edit
        end
      end
    end

    def destroy
      @item = @store.items.find(params[:id])

      flash.now[:notice] = @item.destroy ? t('items.destroy.success') : t('items.destroy.failed')

      redirect_to store_path(@store)
    end

    private

    def item_params
      params.require(:item).permit(
        :name,
        :description,
        item_categories_attributes: %i[id category_id _destroy],
        item_labels_attributes: %i[id label_id _destroy],
        photos: []
      )
    end

    def build_related_fields
      @item_categories = @item.item_categories.present? ? @item.item_categories : @item.item_categories.build
    end

    def find_store
      @store = current_user.stores.where(id: params[:store_id]).first

      redirect_to stores_path and return unless @store
    end
  end
end
