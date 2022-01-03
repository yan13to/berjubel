# frozen_string_literal: true

# CategoryProperty model
class CategoryProperty < ApplicationRecord
  belongs_to :category
  belongs_to :property
end
