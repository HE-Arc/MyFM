class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.date :creation_date
      t.string :lastFM_bandname
      t.text :bio
      t.string :twitter_url
      t.string :avatar
      t.timestamps
    end
  end
end
