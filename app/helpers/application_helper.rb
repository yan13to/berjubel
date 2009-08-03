module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def build_list_menu(page_id, menu_items, options = {}, all_linkable = true)
    content = []
    menu_items.each do |menu|
      klass = build_class(page_id, menu[2])
      order = build_class_order(menu_items, menu)
      css = "#{klass} #{order}"
      if all_linkable == true
        link = link_to(menu[0], menu[1], :class => css )
      else
        if klass == 'active'
          link = link_to(menu[0], menu[1], :class => css )
        else
          link = menu[0]
        end
      end
      content << content_tag(:li, link, :class => css )
    end
    content_tag(:ul, content, options)
  end

  def build_class_order(menu_items, menu)
    first = menu_items.first
    last = menu_items.last    
    return ' first' if menu == first
    return ' last' if menu == last  
    return ''
  end

  def build_class(page_id, menu="")
    (menu == page_id ? 'active' : 'inactive')
  end

  def main_tabs
    menus = []
    menus << ["Home", items_url, "Home"]
    menus << ["New Item", category_items_url, "New Item"]
    # menus << ["#{current_user.username}", logout_url, "Logout"] unless current_user.nil?
  end

  def link_to_category(category)
    link_to(category.name, "/items/category/#{category.id}", :title => category.description)
  end

end
