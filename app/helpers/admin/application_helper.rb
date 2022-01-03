# frozen_string_literal: true

# ApplicationHelper
module Admin::ApplicationHelper
  def admin_page_title
    title = []
    title << Rails.application.config.x.app_name
    title << t('admin.title')
    title << @page_title if @page_title
    title.compact.join(' | ')
  end

  def render_admin_header
    render 'header'
  end

  def render_admin_breadcrumbs(items)
    content_for :breadcrumbs do
      render 'breadcrumbs', items: items
    end
  end

  def render_admin_main_nav(active)
    content_for :main_nav do
      render 'main_nav', active: active
    end
  end

  def render_admin_page_title(title)
    @page_title = title
  end
end
