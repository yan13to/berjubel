# frozen_string_literal: true

# User model
class User < ApplicationRecord
  attr_accessor :from_api

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  include DeviseTokenAuth::Concerns::User

  has_one_attached :avatar

  has_many :stores

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
