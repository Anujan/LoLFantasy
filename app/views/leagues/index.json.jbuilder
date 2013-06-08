json.array!(@leagues) do |league|
  json.extract! league, :name, :creator, :private, :start_week
  json.url league_url(league, format: :json)
end