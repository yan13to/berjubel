class HomeController < ApplicationController
  before_filter :set_tab
  
  def index
    @categories = Category.tops
  end

  private
  
  def set_tab
    @page_id = 'browse'
  end

end
