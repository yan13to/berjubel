# frozen_string_literal: true

# ItemLabel model
class ItemLabel < ApplicationRecord
  belongs_to :item
  belongs_to :label
end
