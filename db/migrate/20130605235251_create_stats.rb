class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :player_id
      t.integer :week
      t.integer :kills
      t.integer :deaths
      t.integer :assists
      t.integer :csmin

      t.timestamps
    end
  end
end
