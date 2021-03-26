# frozen_string_literal: true

class Item::Label < ApplicationRecord
  belongs_to :store
  belongs_to :item
  belongs_to :label
end
