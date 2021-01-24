# frozen_string_literal: true

# User model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  include DeviseTokenAuth::Concerns::User

  has_one_attached :avatar

  has_many :stores

  protected

  def generate_confirmation_token
    if confirmation_token && !confirmation_period_expired?
      @raw_confirmation_token = confirmation_token
    else
      confirmation_token = @raw_confirmation_token = Devise.friendly_token(4).upcase
      confirmation_sent_at = Time.now.utc
    end
  end
end
