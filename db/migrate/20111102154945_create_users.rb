class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :firstname
      t.string :nickname
      t.date :borndate
      t.datetime :createddate

      t.timestamps
    end
  end
end
