class UploaderController < ApplicationController

  def create
    @asset = Asset.new(params[:file])
    responds_to_parent do
      render :update do |page|
        page << "$('item_file').toggle()"
        page.replace_html :test, @asset.id
        page[:test].show
      end
    end
  end

end
