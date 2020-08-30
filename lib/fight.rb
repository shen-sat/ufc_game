class Fight
	attr_reader :fighter_a, :fighter_b

	def initialize(fighter_a:, fighter_b:)
		@fighter_a = fighter_a
		@fighter_b = fighter_b
	end

	def aggressor
		return if fighter_a.initiate_action_score == fighter_b.initiate_action_score
		
		fighter_a.initiate_action_score > fighter_b.initiate_action_score ? fighter_a : fighter_b 
	end

	def step
		sleep 5
		agg = aggressor
		# commentary(agg, :aggressor)
	end
end