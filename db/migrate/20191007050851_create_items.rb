class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :store_id
      t.string :name
      t.decimal :price, precision: 5, scale: 2
      t.integer :stock, default: 0

      t.timestamps
    end
  end
end
