class CreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_profiles do |t|
      t.belongs_to :user
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
