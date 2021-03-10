# frozen_string_literal: true

# User model
class User < ApplicationRecord
  attr_accessor :from_api

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  include DeviseTokenAuth::Concerns::User

  has_one :profile, class_name: 'User::Profile'
  has_one :setting, class_name: 'User::Setting'

  has_many :stores

  def send_confirmation_instructions(opts = {})
    generate_confirmation_token! unless @raw_confirmation_token

    opts[:client_config] ||= 'default'
    opts[:to] = unconfirmed_email if pending_reconfirmation?
    opts[:redirect_url] ||= DeviseTokenAuth.default_confirm_success_url

    if from_api
      send_devise_notification(:confirmation_instructions, @raw_confirmation_token, opts)
    else
      DeviseMailer.confirmation_instructions(self, @raw_confirmation_token, opts).deliver_now
    end
  end

  def send_confirmation_notification?
    return true unless from_api
  end

  protected

  def generate_confirmation_token
    if confirmation_token && !confirmation_period_expired?
      @raw_confirmation_token = confirmation_token
    else
      self.confirmation_token = @raw_confirmation_token = set_confirmation_token
      self.confirmation_sent_at = Time.now.utc
    end
  end

  private

  def set_confirmation_token
    from_api ? Devise.friendly_token(4).upcase : Devise.friendly_token
  end
end
