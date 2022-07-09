require_relative '../lib/game'
require_relative '../lib/display'
require_relative '../lib/board'
require_relative '../lib/main'

describe Game do
  describe '#get_symbol' do

    subject(:game) { described_class.new }

    before do
      valid_input = '@'
      allow(game).to receive(:gets).and_return(valid_input)
    end

    context 'when valid symbol inputted' do
      valid_input = '@'
      it 'return symbol' do
        expect(game.get_symbol).to eq(valid_input)
      end
    end

    error_message = "That is not a valid symbol or it is already taken. Your symbol must be a single letter or special character"

    context 'when user inputs invalid input once and then valid ' do

      before do
        invalid_input = '1'
        valid_input = '@'
        allow(game).to receive(:gets).and_return(invalid_input, valid_input)
      end

      it 'loop ends and puts error message once' do
        expect(game).to receive(:puts).with(error_message).once
        game.get_symbol
      end
    end

    context 'when user inputs invalid input twice and then valid' do

      before do
        invalid_input = '1'
        valid_input = '@'
        allow(game).to receive(:gets).and_return(invalid_input, invalid_input, valid_input)
      end

      it 'loop ends and puts error message twice' do
        expect(game).to receive(:puts).with(error_message).twice
        game.get_symbol
      end
    end
  end
end
