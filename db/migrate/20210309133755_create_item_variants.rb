class CreateItemVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :item_variants do |t|
      t.belongs_to :item
      t.string :field_name
      t.string :value

      t.timestamps
    end
  end
end
