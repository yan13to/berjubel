class CreateItemPrices < ActiveRecord::Migration[6.1]
  def change
    create_table :item_prices do |t|
      t.belongs_to :item
      t.string :name
      t.monetize :amount

      t.timestamps
    end
  end
end
