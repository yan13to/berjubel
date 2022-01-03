# frozen_string_literal: true

module Admin
  # StoresController
  class StoresController < Admin::ApplicationController
    include Pagination

    def index
      @search = Store.ransack(query)
      @stores = @search.result(distinct: true)
                       .page(page)
                       .per(per_page)
                       .order(order)

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
      @store = Store.new
    end

    def create
      @store = Store.new(store_params)

      respond_to do |format|
        if @store.save
          format.html { redirect_to admin_stores_path, notice: t('.success') }
        else
          format.html { render :new, notice: t('.failed') }
        end
      end
    end

    def edit
      @store = Store.find(params[:id])

      respond_to do |format|
        format.html
        format.js
      end
    end

    def update
      @store = Store.find(params[:id])

      respond_to do |format|
        if @store.update(store_params)
          format.html { redirect_to admin_stores_path, notice: t('.success') }
        else
          format.html { render :edit, notice: t('.failed') }
        end
      end
    end

    def destroy
      @store = Store.find(params[:id])

      respond_to do |format|
        if @store.destroy
          format.html { redirect_to admin_stores_path }
        else
          format.html { redirect_to admin_store_path(@store) }
        end
      end
    end

    private

    def store_params
      params.require(:store).permit(:user_id, :name, :description, :domain_name, :avatar)
    end
  end
end
