class Item::Price < ApplicationRecord
  monetize :amount_cents

  belongs_to :item
end
