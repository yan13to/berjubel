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
  end

  # def show
  #   @store = Store.find(params[:id])
  # end

  def new
    @store = current_user.stores.new

    render layout: false
  end

  def create
    @store = current_user.stores.new(store_params)

    if @store.save
      redirect_to @store, notice: t('stores.create.success')
    else
      render :new
    end
  end

  def edit
    @store = current_user.stores.find(params[:id])
  end

  def update
    @store = current_user.stores.find(params[:id])

    if @store.update(store_params)
      redirect_to @store, notice: t('stores.update.success')
    else
      render :edit
    end
  end

  def destroy
    @store = current_user.stores.find(params[:id])

    if @store.destroy
      redirect_to stores_path, notice: t('stores.destroy.success')
    else
      render @store
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :description)
  end
end
