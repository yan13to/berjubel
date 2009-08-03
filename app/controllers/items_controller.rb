class ItemsController < ApplicationController
  before_filter :store_location, :login_required, :except => [:index]

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
    @parent_categories = Category.all_parents
    @category = Category.find(params[:id]) unless params[:id].blank?
  end

  def new
    @tab = "New Item"
    @item = current_user.items.new
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

end
