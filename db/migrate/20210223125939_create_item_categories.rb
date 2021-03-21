class CreateItemCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :item_categories do |t|
      t.belongs_to :item
      t.belongs_to :category

      t.timestamps
    end
  end
end
