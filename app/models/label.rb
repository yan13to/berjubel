# frozen_string_literal: true

# Label model
class Label < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
end
