json.array!(@players) do |player|
  json.extract! player, :name, :price, :position
  json.url player_url(player, format: :json)
end