class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures, :force => true do |t|
      t.string :title
      t.text :description
      t.references :object, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
