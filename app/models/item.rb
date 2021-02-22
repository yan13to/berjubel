# frozen_string_literal: true

# Item model
class Item < ApplicationRecord
  belongs_to :store

  has_many_attached :photos

  def default_photo
    photos.first
  end
end
