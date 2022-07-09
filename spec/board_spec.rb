require_relative '../lib/board'

describe Board do

  describe '#update_board' do

    subject(:board) { described_class.new }

    context 'when passed valid number' do

      before do
        valid_number = '5'
        allow(board).to receive(:gets).and_return(valid_number)
      end

      valid_number = 5
      symbol = '#'
      it 'changes number in @cells to symbol' do
        expect { board.update_board(symbol) }.to change { board.cells[valid_number - 1] }.from(valid_number).to(symbol)
      end

      it 'stops loop and does not receive puts' do
        expect(board).to_not receive(:puts)
        board.update_board(symbol)
      end
    end

    context 'when passed invalid number once' do
      before do
        invalid_number = '10'
        valid_number = '5'
        allow(board).to receive(:gets).and_return(invalid_number, valid_number)
      end
      symbol = '#'
      error_message = 'That square is invalid or already taken, please try again'
      it 'displays error message once' do
        expect(board).to receive(:puts).and_return(error_message).once
        board.update_board(symbol)
      end
    end
  end

  describe '#check_win' do

    subject(:board) { described_class.new }

    context 'when winning combo in @cells' do
      winning_combo = ['@', '@', '@', 4, 5, 6, 7, 8, 9]
      it 'returns true' do
        board.cells = winning_combo
        expect(board.check_win). to be true
      end
    end

    context 'when no winning combo in @cells' do
      losing_combo = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      it 'returns false' do
        board.cells = losing_combo
        expect(board.check_win).to be false
      end
    end
  end
end
