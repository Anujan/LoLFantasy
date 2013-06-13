class AddCsToStats < ActiveRecord::Migration
  def change
  	remove_column :stats, :csmin
    add_column :stats, :cs, :integer
    add_column :stats, :game_mins, :integer
  end
end
