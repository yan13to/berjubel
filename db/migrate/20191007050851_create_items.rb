class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :parent_id
      t.belongs_to :category
      t.belongs_to :user
      t.belongs_to :store
      t.string :name, null: false, default: ''
      t.text :description
      t.boolean :active, null: false, default: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
