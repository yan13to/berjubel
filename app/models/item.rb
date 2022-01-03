# frozen_string_literal: true

# Item model
class Item < ApplicationRecord
  include ActivityControl

  belongs_to :category
  belongs_to :store
  belongs_to :user

  has_many_attached :photos

  has_many :prices, inverse_of: :item, dependent: :destroy
  has_many :item_properties
  has_many :properties, through: :item_properties
  has_many :item_labels
  has_many :labels, through: :item_labels

  accepts_nested_attributes_for :labels

  # validates :photos, blob: { content_type: :image, size_range: 1..10.megabytes }
  validates :name, :description, presence: true

  before_validation do |record|
    record.user = record.store.try(:user) unless record.user
  end

  ransack_alias :all, :name_or_description

  def default_photo
    photos.first
  end
end
