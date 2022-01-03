class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
