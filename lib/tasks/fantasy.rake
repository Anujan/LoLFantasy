require 'rake'
require 'json'
require 'net/http'

namespace :fantasy do
	desc "Update all teams"
	task :update => :environment do 
		Team.all.each do |t| 
			total_points = t.points
			week = ENV['week'].to_i
			t.players.each do |player|
				s = player.stats.find_by_week(week)
				total_points = total_points + s.points
			end
			t.save!
		end
		puts 'All Teams Updated'
	end
end