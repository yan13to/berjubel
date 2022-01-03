class CreateLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :labels do |t|
      t.belongs_to :user
      t.string :name
      t.boolean :active, null: false, default: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
