json.array!(@teams) do |team|
  json.extract! team, :user_id, :name
  json.url team_url(team, format: :json)
end