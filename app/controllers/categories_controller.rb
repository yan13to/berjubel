class CategoriesController < ApplicationController
  def index
    @categories = Category.parents
  end
end
