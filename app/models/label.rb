# frozen_string_literal: true

# Label model
class Label < ApplicationRecord
  validates :name, presence: true
end
