class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :prices do |t|
      t.belongs_to :item
      t.string :name
      t.monetize :amount
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
