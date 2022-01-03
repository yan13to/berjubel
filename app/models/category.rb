# frozen_string_literal: true

# Category model
class Category < ApplicationRecord
  include ActivityControl

  serialize :name, Hash
  serialize :description, Hash

  belongs_to :parent, class_name: 'Category', foreign_key: :parent_id, optional: true

  has_many :children, class_name: 'Category', foreign_key: :parent_id
  has_many :items
  has_many :category_properties, dependent: :destroy
  has_many :properties, through: :category_properties

  has_one_attached :image

  validates :image, blob: { content_type: :image, size_range: 1..5.megabytes }
  validates :name, presence: true, uniqueness: true

  scope :parents, -> { where(parent_id: nil) }

  def children?
    children.size.positive?
  end

  def parent?
    parent.blank?
  end

  def path_ids
    []
  end

  def translated_name
    name[I18n.locale.to_s] || name[I18n.default_locale.to_s]
  end

  def translated_description
    description[I18n.locale.to_s] || description[I18n.default_locale.to_s]
  end

  class << self
    def to_nested_array
      nested_array(parents)
    end

    private

    def nested_array(categories)
      categories.map do |category|
        collection = category.parent? ? [category.translated_name] : [category.translated_name, category.id, { class: 'form-control' }]
        collection << nested_array(category.children) if category.children.compact.any?
        collection
      end
    end
  end
end
