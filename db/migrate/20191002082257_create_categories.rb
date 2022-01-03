class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.text :icon
      t.text :name
      t.text :description
      t.integer :position
      t.boolean :active, null: false, default: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
