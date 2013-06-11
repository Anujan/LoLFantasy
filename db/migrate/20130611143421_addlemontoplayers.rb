class Addlemontoplayers < ActiveRecord::Migration
  def change
  	Player.create!(name: "LemonNation", team: "C9", price: 2000, role: "Support")
  end
end
