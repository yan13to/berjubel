# frozen_string_literal: true

# ItemPrice
class ItemPrice < ApplicationRecord
  monetize :amount_cents

  belongs_to :item
end
