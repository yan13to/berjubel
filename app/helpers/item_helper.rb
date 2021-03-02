# frozen_string_literal: true

# ItemHelper
module ItemHelper
  def build_items_classes(mode = 'column')
    if mode == 'list'
      'd-flex flex-column'
    else
      'd-flex align-items-center align-content-stretch flex-wrap'
    end
  end
end
