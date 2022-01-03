# frozen_string_literal: true

module Admin
  # CategoriesController
  class CategoriesController < Admin::ApplicationController
    include Pagination

    def index
      @search = Category.ransack(query)
      @categories = @search.result(distinct: true)
                           .order(order)
                           .page(page)
                           .per(per_page)

      respond_to do |format|
        format.html
      end
    end

    def show
      @category = Category.find(params[:id])

      respond_to do |format|
        format.html
        format.js
      end
    end

    def new
      @category = Category.new

      respond_to do |format|
        format.html
      end
    end

    def create
      @category = Category.new(category_params)

      respond_to do |format|
        if @category.save
          format.html { redirect_to admin_categories_path, notice: t('.success') }
        else
          format.html { render :new }
        end
      end
    end

    def edit
      @category = Category.find(params[:id])

      respond_to do |format|
        format.html
      end
    end

    def update
      @category = Category.find(params[:id])

      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to admin_category_path(@category), notice: t('.failed') }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @category = Category.find(params[:id])

      respond_to do |format|
        if @category.destroy
          format.html { redirect_to admin_categories_path, notice: t('.success') }
        else
          format.html { redirect_to admin_categories_path, notice: t('.failed') }
        end
      end
    end

    private

    def category_params
      params.require(:category)
            .permit(
              :parent_id,
              :property_ids,
              :avatar,
              :active,
              :icon,
              name: I18n.available_locales,
              description: I18n.available_locales
            )
    end
  end
end
