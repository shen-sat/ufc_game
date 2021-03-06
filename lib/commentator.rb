class Commentator
	attr_reader :commentary

	def initialize(commentary)
		@commentary = commentary
	end

	def say(fighter, action)
		if fighter
			line = choose_line(action)
			fill_in(fighter, line)
		else
			choose_line(:stalemate)
		end
	end

private

	def choose_line(action)
		# puts action.is_a?(Symbol)
		# puts "action is: #{action}"
		# puts "commentary action is: #{commentary[action]}"
		commentary[action.to_s].sample
	end

	def fill_in(fighter, line)
		word_to_replace = line.match(/{.+}/).to_s.delete("{}")
		word_to_insert = eval word_to_replace
		new_line = line.gsub(/{.+}/, word_to_insert)
	end

end