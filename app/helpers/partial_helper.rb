# frozen_string_literal: true

# PartialHelper
module PartialHelper
  def render_breadcrumbs(items = [])
    return if items.empty?

    content_for :breadcrumbs do
      render 'breadcrumbs', items: items
    end
  end

  def render_locale_form
    render 'locale_form'
  end

  def render_success_message(messages)
    render 'success_message', messages: messages if messages.present?
  end

  def render_success_message_for(model, field)
    render 'success_message_for', model: model, field: field # if messages.present?
  end

  def render_error_message(messages)
    render 'error_message', messages: messages if messages.present?
  end

  def render_error_message_for(model, field)
    messages = if model.errors[field].present?
                 model.errors[field]
               else
                 [[model.class.human_attribute_name(field), I18n.t('errors.messages.invalid')].join(' ')]
               end
    render 'error_message_for', messages: messages # if messages.present?
  end

  def render_header
    render 'header' unless devise_controller?
  end

  def render_main_modal
    render 'main_modal'
  end

  def render_records_navigation(records)
    render 'records_navigation', records: records
  end

  def render_search_form
    content_for :search_form do
      render 'search_form'
    end
  end

  def render_upper_alert
    render 'upper_alert'
  end
end
