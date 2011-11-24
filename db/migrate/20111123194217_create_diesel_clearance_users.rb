class CreateDieselClearanceUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string   :email
      t.string   :firstname
      t.string   :name
      t.date     :borndate
      t.datetime :last_signed_in_at
      t.string   :encrypted_password, :limit => 128
      t.string   :salt,               :limit => 128
      t.string   :confirmation_token, :limit => 128
      t.string   :remember_token,     :limit => 128
      t.timestamps
    end

    add_index :users, :email
    add_index :users, :remember_token
  end

  def self.down
    drop_table :users
  end
end