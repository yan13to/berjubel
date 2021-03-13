# frozen_string_literal: true

# ApplicationHelper
module ApplicationHelper
  def page_title
    title = ['Berjubel']
    title << @page_title
    title.compact.join(' | ')
  end

  def item_listing_mode
    current_user.try(:setting).try(:listing_mode) || 'column'
  end

  def render_user_name
    current_user.try(:profile).try(:first_name) || current_user.email
  end

  def render_user_avatar
    avatar = current_user.try(:profile).try(:avatar)

    if avatar&.attached?
      image_tag avatar.variant(resize_to_limit: [40, 40]), class: 'rounded-circle'
    else
      image_tag '/default/avatar.svg', width: '34px'
    end
  end

  def render_success_message(messages)
    render 'success_message', messages: messages if messages.present?
  end

  def render_error_message(messages)
    render 'error_message', messages: messages if messages.present?
  end

  def render_error_message_for(messages)
    render 'error_message_for', messages: messages if messages.present?
  end

  def render_field_class(object, field)
    'form-control is-invalid' if object.errors.messages[field].present?
    'form-control'
  end

  def render_floating_alert(messages, type = :danger)
    alert_message = if type == :danger
                      render_error_message(messages)
                    else
                      render_success_message(messages)
                    end

    return unless messages.present?

    content_for :alert do
      render 'floating_alert', messages: alert_message
    end
  end

  def render_breadcrumbs(items = [])
    return if items.empty?

    content_for :breadcrumbs do
      render 'breadcrumbs', items: items
    end
  end

  def render_search_form
    content_for :search_form do
      render 'layouts/search_form'
    end
  end

  def render_locale_form
    render 'layouts/locale_form'
  end

  def render_locale_selector(current_path)
    render 'locale_selector', current_path: current_path || 'root_path'
  end

  def link_to_main_modal(name, options = {})
    link_options = {}
    link_options.merge!('data-bs-toggle': :modal)
    link_options.merge!('data-bs-title': options[:title]) if options[:title]
    link_options.merge!('data-bs-body': options[:body]) if options[:body]
    link_options.merge!('data-remote': true)
    link_options.merge!('data-url': options[:url]) if options[:url]
    link_options.merge!('data-params': options[:params]) if options[:params]
    link_options.merge!('data-method': options[:method]) if options[:method]
    link_options.merge!(class: options[:class]) if options[:class]

    link_to name, '#mainModal', link_options
  end

  private

  def alerty_types
    %i[primary secondary danger success warning info light dark]
  end
end
