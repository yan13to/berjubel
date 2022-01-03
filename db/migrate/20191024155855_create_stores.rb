class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.belongs_to :user
      t.string :domain_name
      t.string :name
      t.text :description
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end
