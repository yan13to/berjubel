# frozen_string_literal: true

# Item model
class Item < ApplicationRecord
  belongs_to :store

  has_many_attached :photos

  has_many :item_categories, class_name: 'Item::Category', inverse_of: :item, dependent: :destroy
  has_many :categories, through: :item_categories

  has_many :item_labels, class_name: 'Item::Label', inverse_of: :item, dependent: :destroy
  has_many :lables, through: :item_labels

  has_many :prices, class_name: 'Item::Price', inverse_of: :item, dependent: :destroy
  has_many :variants, class_name: 'Item::Variant', inverse_of: :item, dependent: :destroy

  validates :photos, blob: { content_type: :image, size_range: 1..5.megabytes }
  validates :title, :description, presence: true

  def default_photo
    photos.first
  end
end
