class Item < ApplicationRecord
  belongs_to :store

  has_many_attached :photos
end
