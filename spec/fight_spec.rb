require_relative '../lib/fight.rb'

describe 'Fight' do
	let(:fighter_a) { double() }
	let(:fighter_b) { double() }
	let(:commentator) { double() }
	let(:fight) { Fight.new(fighter_a: fighter_a, fighter_b: fighter_b, commentator: commentator) }

	it 'initializes with correct attributes' do
		expect(fight.fighter_a).to eq(fighter_a)
		expect(fight.fighter_b).to eq(fighter_b)
		expect(fight.commentator).to eq(commentator)
	end

	it 'returns the aggressor' do
		allow(fighter_a).to receive(:initiate_action_score).and_return(19)
		allow(fighter_b).to receive(:initiate_action_score).and_return(11)

		expect(fight.aggressor).to eq(fighter_a) 		
	end

	it 'returns nil when aggressors have same score' do
		allow(fighter_a).to receive(:initiate_action_score).and_return(19)
		allow(fighter_b).to receive(:initiate_action_score).and_return(19)

		expect(fight.aggressor).to eq(nil)
	end

	it 'sleeps for 5 seconds' do
		allow(fighter_a).to receive(:initiate_action_score)
		allow(fighter_b).to receive(:initiate_action_score)
		allow(commentator).to receive(:say)
		
		expect(fight).to receive(:sleep).with(5)

		fight.step
	end

	it 'returns an aggressor line' do
		allow(fight).to receive(:sleep)
		allow(fight).to receive(:aggressor).and_return(fighter_a)
		allow(commentator).to receive(:say).with(fighter_a, :aggressor).and_return('Fighter A presses!')

		expect(fight.step).to eq('Fighter A presses!')

	end

end