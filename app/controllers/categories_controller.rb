class CategoriesController < ApplicationController
  def index
    @page_id = 'browse'
    @categories = Category.all
  end
end
