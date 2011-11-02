class RemoveSomeDates < ActiveRecord::Migration
  def up
    remove_column :users, :createddate
  end

  def down
    add_column :users, :createddate, :datetime
  end
end
