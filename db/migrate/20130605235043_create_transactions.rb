class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :team_id
      t.integer :player_id
      t.string :action

      t.timestamps
    end
  end
end
