# frozen_string_literal: true

# ApplicationHelper
module ApplicationHelper
  def render_page_title
  end

  def render_user_name
    current_user.try(:profile).try(:first_name) || current_user.email
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

  def render_breadcrumbs
  end

  private

  def alerty_types
    %i[primary secondary danger success warning info light dark]
  end
end
