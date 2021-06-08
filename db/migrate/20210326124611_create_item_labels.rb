class CreateItemLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :item_labels do |t|
      t.belongs_to :user
      t.belongs_to :store
      t.belongs_to :item
      t.belongs_to :label
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
