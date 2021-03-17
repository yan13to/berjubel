# frozen_string_literal: true

# Store model
class Store < ApplicationRecord
  belongs_to :user

  has_many :items, dependent: :destroy

  has_one_attached :avatar

  validates :avatar, blob: { content_type: :image, size_range: 1..5.megabytes }
  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
