class CreateBandrelations < ActiveRecord::Migration
  def change
    create_table :bandrelations do |t|
      t.integer :user_id
      t.integer :band_id

      t.timestamps
    end
    add_index :bandrelations, :user_id
    add_index :bandrelations, :band_id
    add_index :bandrelations, [:user_id, :band_id], :unique => true
  end
  
  def self.down
    drop_table :bandrelations
  end
end
