require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'game.rb'
require_relative 'player.rb'



class Play
  include Display

  def initialize
    game = Game.new
    game.setup
    game.next_turn
  end
end

Play.new
