class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :user_id
      t.boolean :private
      t.integer :start_week
  	  t.string :token

      t.timestamps
    end
  end
end
