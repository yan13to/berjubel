# frozen_string_literal: true

# ItemProperty model
class ItemProperty < ApplicationRecord
  belongs_to :item
  belongs_to :property
end
