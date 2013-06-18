class Player < ActiveRecord::Base
	has_many :stats, class_name: 'Stats'
	belongs_to :team_player

	def to_param
		name
	end

	def total_points
		points = 0
	end

	def kda
		ratio = 0
	end

	def csmin
		0
	end

	def sell_price
		price * 0.75
	end
end