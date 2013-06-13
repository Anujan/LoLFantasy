class Stats < ActiveRecord::Base
	belongs_to :player
	
	def csmin
		cs/game_mins
	end

	def kda
		(kills + assists) / deaths
	end

	def points
		if player.role == 'Support'
			kda * 2
		else
			kda + (csmin * 0.5)
		end
	end
end