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
    'is-invalid' if object.errors.messages[field].present?
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

  private

  def alerty_types
    %i[primary secondary danger success warning info light dark]
  end
end
