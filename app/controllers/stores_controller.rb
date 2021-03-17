# frozen_string_literal: true

# StoresController
class StoresController < ApplicationController
  include Pagination

  before_action :authenticate_user!

  def index
    @stores = current_user.stores
                          .ransack(query)
                          .result(distinct: true)
                          .order(order)
                          .page(page)
                          .per_page(per_page)

    render partial: 'stores' and return if request.xhr?
  end

  def show
    @store = Store.find(params[:id])

    redirect_to stores_path and return unless @store

    @items = @store.items
                   .search(query)
                   .result(distinct: true)
                   .order(order)
                   .page(page)
                   .per_page(per_page)
  end

  def new
    @store = current_user.stores.new

    render partial: 'form' and return if request.xhr?
  end

  def create
    @store = current_user.stores.new(store_params)

    if @store.save
      redirect_to stores_path, notice: t('stores.create.success')
    else
      render partial: 'form', status: :unprocessable_entity and return if request.xhr?

      render :new
    end
  end

  def edit
    @store = current_user.stores.find(params[:id])

    render partial: 'form' and return if request.xhr?
  end

  def update
    @store = current_user.stores.find(params[:id])

    if @store.update(store_params)
      redirect_to previous_or_current_path(store_path(@store)), notice: t('stores.update.success')
    else
      render partial: 'form', status: :unprocessable_entity and return if request.xhr?

      render :edit
    end
  end

  def destroy
    @store = current_user.stores.find(params[:id])

    if @store.destroy
      redirect_to stores_path, notice: t('stores.destroy.success')
    else
      render stores_path
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :description, :avatar)
  end
end
