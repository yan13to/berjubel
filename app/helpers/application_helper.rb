# frozen_string_literal: true

# ApplicationHelper
module ApplicationHelper
  def page_title
    title = ['Berjubel']
    title << @page_title
    title.compact.join(' | ')
  end

  def berjubel_logo
    [content_tag(:i, nil, class: 'bi bi-bootstrap-fill fs-3'), Rails.configuration.x.app_name.gsub('B', '')].join('&nbsp;').html_safe
  end

  def body_class
    'class=page-error' if @page_error
  end

  def item_listing_mode
    current_user.try(:setting).try(:listing_mode) || 'column'
  end

  def render_item_listing(items, options = {})
    if items.any?
      render "items/#{item_listing_mode.pluralize}", items: items, options: options
    else
      render 'empty'
    end
  end

  def render_user_name
    current_user.try(:profile).try(:first_name) || current_user.email
  end

  def render_user_avatar
    avatar = current_user.try(:profile).try(:avatar)

    if avatar&.attached?
      image_tag avatar.variant(resize_to_limit: [40, 40], crop: '40x40+0+0')
    else
      image_tag '/default/avatar.svg', width: '34px'
    end
  end

  def render_field_class(object, field)
    return 'form-control is-invalid' if object.errors[field].present?
    return 'form-control is-valid' if object.errors[field].blank? && object[field].present?

    'form-control'
  end

  def render_floating_alert(messages, type = :danger)
    alert_message = if type == :danger
                      render_error_message(messages)
                    else
                      render_success_message(messages)
                    end

    return unless messages.present?

    @page_error = true

    content_for :alert do
      render 'floating_alert', messages: alert_message
    end
  end

  def render_locale_selector(current_path)
    render 'locale_selector', current_path: current_path || 'root_path'
  end

  def link_to_back
    link_to 'javascript:window.history.back()' do
      content_tag(:i, nil, class: 'bi bi-arrow-left')
    end
  end

  def link_to_main_modal(name, options = {})
    link_to name, '#mainModal', main_modal_options(options)
  end

  def link_to_remote_dropdown(name, path, options = {})
    link_to_unless_current name, path, remote_dropdown_options(options)
  end

  private

  def main_modal_options(options = {})
    link_options = {}
    link_options.merge!('data-bs-toggle': :modal)
    link_options.merge!('data-bs-title': options[:title]) if options[:title]
    link_options.merge!('data-bs-processor': options[:processor]) if options[:processor]
    link_options.merge!('data-bs-url': options[:url]) if options[:url]
    link_options.merge!('data-bs-params': options[:params]) if options[:params]
    link_options.merge!('data-bs-method': options[:method]) if options[:method]
    link_options.merge!('data-bs-size': options[:size]) if options[:size]
    link_options.merge!(class: options[:class]) if options[:class]
    link_options
  end

  def remote_dropdown_options(options = {})
    html_class = ['dropdown-toggle']
    html_class << options[:class] if options[:class]

    link_options = {}
    link_options.merge!(class: html_class.join(' '))
    link_options.merge!('data-bs-toggle': 'dropdown')
    link_options.merge!('data-bs-dropdown': 'remote')
    link_options.merge!('data-bs-url': options[:url])
    link_options
  end

  def alerty_types
    %i[primary secondary danger success warning info light dark]
  end
end
