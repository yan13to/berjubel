module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def site_name
    "eJubel"
  end

  def link_to_site_name
    link_to site_name, "/"
  end

  def set_focus_to(id)
    javascript_tag("$('#{id}').focus()");
  end

  def page_id
    @page_id ||= "#{params[:controller]}_#{params[:action]}"
  end

  def build_list_menu(menu_items, page_id = page_id, options = {}, all_linkable = true)
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

  def main_tabs(menus = [])
    menus << ["Browse", "/categories", "browse"]
    menus << ["Post", new_item_url, "post"]
  end

  def link_to_category(category)
    link_to(category.name, select_a_category_url(:tid => 'browse', :id => category.id), :title => category.description, :id => "cid_#{category.id}", :class => "cat_link")
  end

  def my_account_link
    current_user.blank? ? link_to("login/signup", "/login") : "Welcome back <em>#{current_user.username}</em>!, #{link_to("My Home", "/dashboard")} | #{link_to 'Preferences'} | #{link_to("logout", logout_url)}"
  end

  private

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

  # def rounded_corner_stylesheet
  #   content_tag('style', <<-EOT, :type => Mime::CSS)
  #     div.auto_complete {
  #       width: 350px;
  #       background: #fff;
  #     }
  #     div.auto_complete ul {
  #       border:1px solid #888;
  #       margin:0;
  #       padding:0;
  #       width:100%;
  #       list-style-type:none;
  #     }
  #     div.auto_complete ul li {
  #       margin:0;
  #       padding:3px;
  #     }
  #     div.auto_complete ul li.selected {
  #       background-color: #ffb;
  #     }
  #     div.auto_complete ul strong.highlight {
  #       color: #800; 
  #       margin:0;
  #       padding:0;
  #     }
  #   EOT
  # end

end
