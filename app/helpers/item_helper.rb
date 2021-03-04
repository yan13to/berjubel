# frozen_string_literal: true

# ItemHelper
module ItemHelper
  def build_items_classes
    if item_listing_mode == 'list'
      'd-flex flex-column'
    else
      'd-flex align-items-center align-content-stretch flex-wrap'
    end
  end

  def render_listing_items_selector
    render 'items/listing_mode_form'
  end
end
