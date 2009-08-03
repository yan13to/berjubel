class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores, :force => true do |t|
      t.integer :user_id
      t.string  :name
      t.string  :domain
      t.text    :description
      t.string  :location
      t.string  :city
      t.string  :province
      t.string  :zip, :size => 4
      t.timestamps
    end
  end

  def self.down
    drop_table :stores
  end
end
