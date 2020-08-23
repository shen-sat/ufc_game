class Fighter
	attr_reader :name, :lastname, :aggression

	def initialize(name:, lastname:, aggression:)
		@name = name
		@lastname = lastname
		@aggression = aggression
	end

	def initiate_action_score
		return Random.rand(1..10) + aggression
	end
end