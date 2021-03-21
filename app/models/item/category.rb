# frozen_string_literal: true

class Item::Category < ApplicationRecord
  belongs_to :category
  belongs_to :item
end
