class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items, :force => true do |t|
      t.integer   :user_id
      t.integer   :category_id
      t.integer   :store_id
      t.string    :title
      t.text      :description
      t.decimal   :price, :precision => 5, :scale => 2
      t.integer   :location
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
