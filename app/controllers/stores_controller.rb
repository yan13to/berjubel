# frozen_string_literal: true

# StoresController
class StoresController < ApplicationController
  include Pagination

  before_action :authenticate_user!

  def index
    @search = current_user.stores.ransack(query)

    @stores = @search.result(distinct: true)
                     .order(order)
                     .page(page)
                     .per(per_page)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @store = Store.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @store = current_user.stores.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @store = current_user.stores.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to stores_path, notice: t('stores.create.success') }
        format.js { render json: @store.to_json }
      else
        format.html { render :new }
        format.js { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @store = current_user.stores.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @store = current_user.stores.find(params[:id])
    store_params.delete(:domain_name)

    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to previous_or_current_path(store_path(@store)), notice: t('stores.update.success') }
        format.js { render json: @store.to_json }
      else
        format.html { render :edit }
        format.js { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @store = current_user.stores.find(params[:id])

    respond_to do |format|
      if @store.destroy
        format.html { redirect_to stores_path, notice: t('stores.destroy.success') }
      else
        format.html { render stores_path }
      end
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :domain_name, :description, :avatar)
  end
end
