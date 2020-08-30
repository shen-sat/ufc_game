require_relative '../lib/fight.rb'

describe 'Fight' do

	it 'initializes with two fighters' do
		fighter_a = double()
		fighter_b = double()
		fight = Fight.new(fighter_a: fighter_a, fighter_b: fighter_b)

		expect(fight.fighter_a).to eq(fighter_a)
		expect(fight.fighter_b).to eq(fighter_b)
	end

	it 'returns the aggressor' do
		fighter_a = double()
		fighter_b = double()
		fight = Fight.new(fighter_a: fighter_a, fighter_b: fighter_b)

		allow(fighter_a).to receive(:initiate_action_score).and_return(19)
		allow(fighter_b).to receive(:initiate_action_score).and_return(11)

		expect(fight.aggressor).to eq(fighter_a) 		
	end

	it 'returns nil when aggressors have same score' do
		fighter_a = double()
		fighter_b = double()
		fight = Fight.new(fighter_a: fighter_a, fighter_b: fighter_b)

		allow(fighter_a).to receive(:initiate_action_score).and_return(19)
		allow(fighter_b).to receive(:initiate_action_score).and_return(19)

		expect(fight.aggressor).to eq(nil)
	end

	it 'sleeps for 5 seconds' do
		fighter_a = double()
		fighter_b = double()
		fight = Fight.new(fighter_a: fighter_a, fighter_b: fighter_b)

		allow(fighter_a).to receive(:initiate_action_score)
		allow(fighter_b).to receive(:initiate_action_score)

		expect(fight).to receive(:sleep).with(5)

		fight.step
	end

	it 'calls aggressor' do
		fighter_a = double()
		fighter_b = double()
		fight = Fight.new(fighter_a: fighter_a, fighter_b: fighter_b)

		allow(fight).to receive(:sleep)
		allow(fighter_a).to receive(:initiate_action_score)
		allow(fighter_b).to receive(:initiate_action_score)

		expect(fight).to receive(:aggressor)

		fight.step
	end

end