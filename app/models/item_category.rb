# frozen_string_literal: true

# ItemCategory
class ItemCategory < ApplicationRecord
  belongs_to :user
  belongs_to :store
  belongs_to :item
  belongs_to :category

  # cache fields
  before_validation do |record|
    record.user = record.item.user
    record.store = record.item.store
  end
end
