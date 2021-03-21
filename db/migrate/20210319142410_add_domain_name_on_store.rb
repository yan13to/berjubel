class AddDomainNameOnStore < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :domain_name, :string
  end
end
