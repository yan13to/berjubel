class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :store_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
