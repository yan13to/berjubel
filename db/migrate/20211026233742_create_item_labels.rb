class CreateItemLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :item_labels do |t|
      t.belongs_to :item
      t.belongs_to :label

      t.timestamps
    end
  end
end
