# frozen_string_literal: true

# ApplicationHelper
module ApplicationHelper
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
    render 'floating_alert', messages: alert_message if messages.present?
  end

  private

  def alerty_types
    %i[primary secondary danger success warning info light dark]
  end
end
