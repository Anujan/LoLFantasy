class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :user_id
      t.integer :league_id
      t.integer :points
      t.integer :budget
      t.string :name

      t.timestamps
    end
  end
end
