# frozen_string_literal: true

# Category model
class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', foreign_key: :parent_id, optional: true

  has_one_attached :image

  has_many :children, class_name: 'Category', foreign_key: :parent_id

  validates :name, presence: true

  scope :parents, -> { where(parent_id: nil) }

  def children?
    children.size.positive?
  end

  def parent?
    !parent.nil?
  end
end
