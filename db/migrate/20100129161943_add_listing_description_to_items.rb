class AddListingDescriptionToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :listing_description, :string
  end

  def self.down
    remove_column :items, :listing_description
  end
end
