require 'yaml'
require_relative 'commentator'
require_relative 'fighter'
require_relative 'fight'

class Game
	def initialize
		commentary = YAML.load_file('commentary.yml')
		commentator = Commentator.new(commentary)

		puts "Please enter a number 1-10 for Yoel Romero's aggression"
		yoel = Fighter.new(name: 'Yoel', lastname: 'Romero', aggression: gets.strip.to_i)

		puts "Please enter a number 1-10 for Paulo Costa's aggression"
		paolo = Fighter.new(name: 'Paolo', lastname: 'Costa', aggression: gets.strip.to_i)

		fight = Fight.new(fighter_a: yoel, fighter_b: paolo, commentator: commentator)

		10.times { fight.step }
	end
end

Game.new