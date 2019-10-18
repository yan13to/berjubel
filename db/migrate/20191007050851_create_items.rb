class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :store_id
      t.string :title
      t.decimal :price, precision: 5, scale: 2
      t.integer :stock

      t.timestamps
    end
  end
end
