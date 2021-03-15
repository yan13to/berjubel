# frozen_string_literal: true

# Store model
class Store < ApplicationRecord
  belongs_to :user

  has_many :items, dependent: :destroy

  has_one_attached :avatar

  validates :name, :description, presence: true
end
