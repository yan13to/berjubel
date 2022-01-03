# frozen_string_literal: true

# Variant
class Price < ApplicationRecord
  monetize :amount_cents

  belongs_to :item
end
