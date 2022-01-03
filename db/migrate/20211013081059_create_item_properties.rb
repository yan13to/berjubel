class CreateItemProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :item_properties do |t|
      t.belongs_to :category
      t.belongs_to :item
      t.belongs_to :property
      t.string :value

      t.timestamps
    end
  end
end
