# frozen_string_literal: true

# Store model
class Store < ApplicationRecord
  belongs_to :user

  has_many :items, dependent: :destroy

  has_one_attached :avatar do |attachable|
    attachable.variant :small, resize: '80x80'
  end

  validates :avatar, blob: { content_type: :image, size_range: 1..5.megabytes }
  validates :name, :domain_name, uniqueness: true, presence: true
end
