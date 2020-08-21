class Fighter
	attr_reader :name, :lastname, :aggression

	def initialize(name:, lastname:, aggression:)
		@name = name
		@lastname = lastname
		@aggression = aggression
	end
end