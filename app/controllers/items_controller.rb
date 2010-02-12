class ItemsController < ApplicationController
  before_filter :store_location, :login_required, :except => [:index]
  before_filter :set_tab
  
  def index
    @items = Item.all
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def category
    @tab = params[:tid].to_s
    @category_id = params[:id]
    @searched_string = params[:q].to_s

    if @tab == 'search'
      if @searched_string.blank?
        @categories = []
      else
        @categories = Category.all(:conditions => ["name LIKE ? AND parent_id != ?", '%'+@searched_string+'%', ""])
      end
    elsif @tab == 'browse'
      @parent_categories = Category.tops
      unless @category_id.blank?
        @category = Category.find(@category_id)
        @categories = @category.children.blank? ? (@category.parent.nil? ? [] : @category.parent.children) : @category.children
      end
    else
      redirect_to select_a_category(:tid => 'search')
    end

    respond_to do |format|
      format.html
    end
  end

  def create_draft_items
    
  end

  def new
    redirect_to select_a_category_url(:tid => 'search') and return if @category.nil?
    @item = current_user.items.new
    @item.category = @category
    respond_to do |format|
      format.html
    end
  end

  def create
    render :text => params.inspect and return
    @item = current_user.items.new(params[:item])
    if @item.save
      respond_to do |format|
        format.html {redirect_to(items_url)}
      end
    else
      respond_to do |format|
        format.html {render :action => "new"}
      end
    end
  end

  def upload
    
  end

  private
  
  def set_tab
    @page_id = 'post'
  end

end
