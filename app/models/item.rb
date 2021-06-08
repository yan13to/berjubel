# frozen_string_literal: true

# Item model
class Item < ApplicationRecord
  enum status: { draft: 0, active: 1, inactive: 2 }

  belongs_to :user
  belongs_to :store

  has_many_attached :photos

  has_many :item_categories, inverse_of: :item, dependent: :destroy
  has_many :categories, through: :item_categories
  has_many :item_labels, inverse_of: :item, dependent: :destroy
  has_many :labels, through: :item_labels
  has_many :prices, class_name: 'Item::Price', inverse_of: :item, dependent: :destroy
  has_many :variants, class_name: 'Item::Variant', inverse_of: :item, dependent: :destroy

  accepts_nested_attributes_for :item_categories, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :item_labels, allow_destroy: true, reject_if: :all_blank

  validates :photos, blob: { content_type: :image, size_range: 1..10.megabytes }
  validates :name, :description, presence: true

  before_validation do |record|
    record.user = record.store.user
  end

  def default_photo
    photos.first
  end
end
