class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :force => true do |t|
      t.string    :username,                  :limit => 40
      t.string    :email,                     :limit => 100
      t.string    :crypted_password,          :limit => 40
      t.string    :salt,                      :limit => 40
      t.string    :remember_token,            :limit => 40
      t.datetime  :remember_token_expires_at
      t.string    :activation_code,           :limit => 40
      t.datetime  :activated_at
      t.datetime  :last_login
      t.string    :last_login_ip
      t.timestamps
    end
    add_index :users, :username, :unique => true
  end

  def self.down
    drop_table :users
  end
end
