# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'donotreply@berjubel.com'
  layout 'mailer'
end
