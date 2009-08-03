class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions, :force => true do |t|
      t.integer   :item_id
      t.integer   :buyer_id
      t.integer   :seller_id
      t.text      :body
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
