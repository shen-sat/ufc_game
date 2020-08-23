require_relative '../lib/fighter.rb'

describe 'Fighter' do
	it 'initialise with attributes' do
		attrs = { name: 'Diego', lastname: 'Costa', aggression: 9 }
		fighter = Fighter.new(attrs)

		expect(fighter.name).to eq('Diego')
		expect(fighter.lastname).to eq('Costa')
		expect(fighter.aggression).to eq(9)
	end

	it 'raises error with invalid attributes' do
		expect{ Fighter.new }.to raise_error(ArgumentError, 'missing keywords: name, lastname, aggression')
	end

	it 'calculates initiate_action_score' do
		attrs = { name: 'Diego', lastname: 'Costa', aggression: 9 }
		fighter = Fighter.new(attrs)
		allow(Random).to receive(:rand).and_return(5)

		expect(fighter.initiate_action_score).to eq(14)
	end
end