class Player < ActiveRecord::Base
	has_many :stats, class_name: 'Stats'
	belongs_to :team_player

	def to_param
		name
	end

	def total_points
		t = 0
		stats.each do |stat|
			t = t + stat.points
		end
	end

	def kda
		kills = 0
		deaths = 0
		assists = 0
		stats.each do |stat|
			kills += stat.kills
			deaths += stat.deaths
			assists += stat.assists
		end
		return (kills + deaths) / assists.to_f
	end

	def csmin
		cs = 0
		mins = 0
		stats.each do |stat|
			cs += stat.cs
			mins += stat.game_mins
		end
		return cs/min
	end

	def sell_price
		price * 0.75
	end
end