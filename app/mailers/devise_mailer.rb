# frozen_string_literal: true

# DeviseMailer
class DeviseMailer < Devise::Mailer
  def template_paths
    'users/mailer'
  end

  def confirmation_instructions(record, token, opts = {})
    super
  end
end
