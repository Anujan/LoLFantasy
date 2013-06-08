class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :price
      t.string :role

      t.timestamps
    end
  end
end
