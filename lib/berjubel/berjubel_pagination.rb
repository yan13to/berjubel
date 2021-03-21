# frozen_string_literal: true

require 'will_paginate/view_helpers/action_view'

# Berjubel Pagination
class BerjubelPagination < WillPaginate::ActionView::LinkRenderer
  protected

  def page_number(page)
    if page != current_page
      link(page, page, rel: rel_value(page), class: 'btn btn-outline-info')
    else
      tag(:em, page, class: 'current btn')
    end
  end

  def previous_or_next_page(page, text, classname)
    if page
      link(text, page, class: [classname, 'btn'].join(' '))
    else
      tag(:span, text, class: [classname, 'btn'].join(' ') + ' disabled')
    end
  end
end
