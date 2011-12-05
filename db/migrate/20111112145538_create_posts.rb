class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :comment_id
      t.string :comment_type

      t.timestamps
    end
  end
end
