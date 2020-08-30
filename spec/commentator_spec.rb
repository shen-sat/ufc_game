require_relative '../lib/commentator.rb'

describe 'Commentator' do
	
	it 'initializes with a commentary file' do
		commentary = { aggressor: ['Fighter A presses'], stalemate: ['Neither fighter moves'] }
		commentator = Commentator.new(commentary)

		expect(commentator.commentary[:aggressor]).to eq(['Fighter A presses'])
		expect(commentator.commentary[:stalemate]).to eq(['Neither fighter moves'])
	end

	it 'says aggresor line for fighter' do
		commentary = { aggressor: ['{fighter.lastname} presses'] }
		commentator = Commentator.new(commentary)
		
		fighter = double()
		allow(fighter).to receive(:lastname).and_return('Romero') 

		expect(commentator.say(fighter, :aggressor)).to eq('Romero presses')
	end

	it 'says stalemate line for nil' do
		commentary = { stalemate: ['Neither fighter presses'] }
		commentator = Commentator.new(commentary)

		expect(commentator.say(nil, :aggressor)).to eq('Neither fighter presses')
	end
end