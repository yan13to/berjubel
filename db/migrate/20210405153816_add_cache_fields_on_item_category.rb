class AddCacheFieldsOnItemCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :item_categories, :user_id, :integer
    add_column :item_categories, :store_id, :integer
  end
end
