class CreateCategoryProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :category_properties do |t|
      t.belongs_to :category
      t.belongs_to :property
      t.boolean :required, default: false, null: false
      t.integer :format, default: 0, null: false

      t.timestamps
    end
  end
end
