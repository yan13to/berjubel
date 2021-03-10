# frozen_string_literal: true

class Item::Variant < ApplicationRecord
  belongs_to :item
end
