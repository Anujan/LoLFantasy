require 'rake'
require 'json'
require 'net/http'

namespace :fantasy do
	desc "Update all teams"
	task :update => :environment do 
		Team.all.each do |t| 
			total_points = t.points
			week = ENV['week'].to_i
			t.team_players.each do |tp|
				s = tp.player.stats.find_by_week(week)
				total_points = total_points + s.points unless s.nil?
			end
			t.update_column(:points, total_points)
		end
		puts 'All Teams Updated'
	end
end