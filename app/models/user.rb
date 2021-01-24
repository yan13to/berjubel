# frozen_string_literal: true

# User model
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  include DeviseTokenAuth::Concerns::User

  attr_accessor :from_api

  has_one_attached :avatar

  has_many :stores

  protected

  def generate_confirmation_token
    if self.confirmation_token && !confirmation_period_expired?
      @raw_confirmation_token = self.confirmation_token
    else
      self.confirmation_token = @raw_confirmation_token = self.from_api ? Devise.friendly_token(4).upcase : Devise.friendly_token
      self.confirmation_sent_at = Time.now.utc
    end
  end
end
