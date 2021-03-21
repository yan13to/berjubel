class CreateUserSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :user_settings do |t|
      t.belongs_to :user

      t.string :currency, null: false, default: 'usd'
      t.string :locale, null: false, default: 'en'
      t.integer :listing_mode, null: false, default: 0

      t.timestamps
    end
  end
end
