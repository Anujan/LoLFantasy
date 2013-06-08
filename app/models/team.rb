class Team < ActiveRecord::Base
	belongs_to :league
	has_many :team_players #Think about this...
	belongs_to :user
	has_many :transactions
	before_create :set_defaults

	def set_defaults
		self.points = 0
		self.budget = 10000
	end

	def buy(player)
		roles = []
		team_players.each do |tp|
			roles << tp.role
		end
		if roles.include? player.role
			return false
		else
			tp = team_players.new(player_id: player.id, role: player.role)
			if tp.save
				self.budget -= player.price
				save
			end
		end
		true
	end

	def sell(player)
		team_players.each do |tp|
			if (tp.player_id == player.id && !tp.destroyed?)
				tp.destroy!
				self.budget += player.sell_price
				save
				return true
			end
		end
		false
	end

	def has_player(player)
		team_players.each do |tp|
			if (tp.player_id == player.id)
				return true
			end
		end
		false
	end
end
