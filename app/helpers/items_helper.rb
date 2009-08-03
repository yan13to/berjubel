module ItemsHelper

  def display_categories_breadcrumb(category=nil)
    html = ""
    unless category.nil?
      html += "<span>#{category.name}</span>"
      while !category.parent.nil? do
        category = category.parent
        html = "<span>#{category.name}</span>&nbsp;&gt;&nbsp;" + html
      end
    end
    return html
  end

  def display_categories(categories)
    
  end

end
