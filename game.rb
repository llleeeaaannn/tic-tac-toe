require_relative 'player.rb'

class Game

  include Display

  attr_accessor :player_one, :player_two

  def initialize
    @board = Board.new
    @player_one = Player.new(nil, nil)
    @player_two = Player.new(nil, nil)
    @turn = 0
  end

  def setup
    start_game()

    player_name_prompt(1)
    player_one.name = gets.chomp.to_s
    player_symbol_prompt
    player_one.symbol = get_symbol()

    player_name_prompt(2)
    player_two.name = gets.chomp.to_s
    player_symbol_prompt
    player_two.symbol = get_symbol()
  end

  def get_symbol
    input = gets.chomp.to_s
    if input.match?(/^\D{1}$/) && input != player_one.symbol && input != player_two.symbol
      input
    else
      invalid_symbol()
      get_symbol()
    end
  end

  def next_turn
    if @turn.even?
      @board.display_board
      turn_prompt_one()
      @board.update_board(gets.chomp.to_i, player_one.symbol)
    else
      @board.display_board
      turn_prompt_two()
      @board.update_board(gets.chomp.to_i, player_two.symbol)
    end
    if @board.check_win()
      puts @turn.even? ? game_won(player_one.name) : game_won(player_two.name)
      @board.display_board
      play_again_prompt()
    elsif @turn == 8
      game_over()
      @board.display_board
      play_again_prompt()
    else
      @turn += 1
      next_turn()
    end
  end
end
