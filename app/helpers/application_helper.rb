# frozen_string_literal: true

# ApplicationHelper
module ApplicationHelper
  def render_error_message(type, message)
    render 'error_message', type: type, message: message if message.compact.present?
  end

  def render_error_message_for(messages)
    render 'error_message_for', messages: messages if messages.compact.present?
  end
end
