# frozen_string_literal: true

# Store model
class Store < ApplicationRecord
  belongs_to :user

  has_many :items

  has_one_attached :avatar
end
