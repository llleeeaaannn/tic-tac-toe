require_relative 'display.rb'

class Board

  include Display

  attr_accessor :cells

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    puts
    puts "    #{cells[0]} | #{cells[1]} | #{cells[2]}\n" +
         "   ---+---+---\n" +
         "    #{cells[3]} | #{cells[4]} | #{cells[5]}\n" +
         "   ---+---+---\n" +
         "    #{cells[6]} | #{cells[7]} | #{cells[8]}"
    puts
  end

  def update_board(symbol)
    loop do
      number = gets.chomp.to_i
      return cells[number - 1] = symbol if cells.include?(number)

      puts 'That square is invalid or already taken, please try again'
    end
  end

  def check_win
    won = false
    winning_combos = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
    winning_combos.each do |combo|
      if (@cells[combo[0]] == @cells[combo[1]]) && (@cells[combo[0]] == @cells[combo[2]])
        won = true
      end
    end
    won
  end

end
