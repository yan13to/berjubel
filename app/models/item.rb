# frozen_string_literal: true

# Item model
class Item < ApplicationRecord
  belongs_to :store

  has_many_attached :photos

  has_many :item_categories, class_name: 'Item::Category', inverse_of: :item

  def default_photo
    photos.first
  end
end
