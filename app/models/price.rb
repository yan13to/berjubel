# frozen_string_literal: true

# Variant
class Price < ApplicationRecord
  monetize :amount_cents

  belongs_to :item

  validates :name, presence: true
  validates :amount, numericality: { only_integer: true }
end
