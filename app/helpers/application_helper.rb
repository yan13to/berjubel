# frozen_string_literal: true

# ApplicationHelper
module ApplicationHelper
  def render_error_message(type, message)
    render 'shared/error_message', type: type, message: message if message.present?
  end
end
