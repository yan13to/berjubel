# frozen_string_literal: true

# ItemHelper
module ItemHelper
  def build_items_classes
    if item_listing_mode == 'list'
      'd-flex flex-column'
    else
      'd-flex align-content-stretch flex-wrap'
    end
  end

  def render_item_action(item, options = {})
    render 'item_change', item: item, options: options if current_user.my_store?(item.store)
  end

  def render_listing_items_selector
    render 'listing_mode_form'
  end

  def render_nested_categories(categories)
    render 'stores/items/nested_category', categories: categories
  end

  def render_nested_category_path(category)
    nested_category_path(category).compact.reverse.join(' &rArr; ').html_safe if category
  end

  def nested_category_path(category)
    return unless category

    categories = [category.translated_name]
    categories += nested_category_path(category.parent) if category.parent?
    categories
  end
end
