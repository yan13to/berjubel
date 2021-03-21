# frozen_string_literal: true

# Category model
class Category < ApplicationRecord
  serialize :name, Hash

  belongs_to :parent, class_name: 'Category', foreign_key: :parent_id, optional: true

  has_many :children, class_name: 'Category', foreign_key: :parent_id
  has_many :item_categories, class_name: 'Item::Category'
  has_many :items, through: :item_categories

  has_one_attached :image

  validates :image, blob: { content_type: :image, size_range: 1..5.megabytes }
  validates :name, presence: true, uniqueness: true

  scope :parents, -> { where(parent_id: nil) }

  def children?
    children.size.positive?
  end

  def parent?
    !parent.nil?
  end
end
