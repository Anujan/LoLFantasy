class League < ActiveRecord::Base
	belongs_to :user
	has_many :teams, dependent: :destroy
	validates :name, uniqueness: true, length: {maximum: 30, minimum:4}
	before_create :generate_token

	def generate_token
		self.token = ('a'..'z').to_a.shuffle[0,8].join
	end

	def to_param
		"#{id}-#{name}".parameterize
	end
end
