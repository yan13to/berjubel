# frozen_string_literal: true

# Property model
class Property < ApplicationRecord
  include ActivityControl

  has_many :category_properties
  has_many :categories, through: :category_properties
  has_many :item_properties
  has_many :items, through: :item_properties

  validates :name, presence: true
end
