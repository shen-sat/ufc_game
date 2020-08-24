require_relative '../lib/commentator.rb'

describe 'Commentator' do
	
	it 'initializes with a commentary file' do
		commentary = { aggressor: ['Fighter A presses'], stalemate: ['Neither fighter moves'] }
		commentator = Commentator.new(commentary)

		expect(commentator.commentary[:aggressor]).to eq(['Fighter A presses'])
		expect(commentator.commentary[:stalemate]).to eq(['Neither fighter moves'])
	end
end