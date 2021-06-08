# frozen_string_literal: true

# ItemLabel
class ItemLabel < ApplicationRecord
  belongs_to :user
  belongs_to :store
  belongs_to :item
  belongs_to :label
end
