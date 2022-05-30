module Display

  def start_game
    puts "Let's play some Tic-Tac-Toe! Or as I grew up knowing it: X's and O's"
  end

  def player_name_prompt(num)
    puts "What is player #{num}'s name"
  end

  def player_symbol_prompt
    puts "Choose a letter or special character to use as your symbol."
  end

  def invalid_symbol
    puts "That is not a valid symbol or it is already taken. Your symbol must be a single letter or special character"
  end

  def turn_prompt_one
    puts "Your turn, #{player_one.name}. Choose an available number between 1 and 9 to place your symbol (#{player_one.symbol}) on the corresponding square."
  end

  def turn_prompt_two
    puts "Your turn, #{player_two.name}. Choose an available number between 1 and 9 to place your symbol (#{player_two.symbol}) on the corresponding square."
  end

  def game_won(player)
    "Congratulations, #{player} you have won! Here is the final board:"
  end

  def game_over
    puts "Unfortunately the game is over. It was a draw! Here is the final board:"
  end

  def play_again_prompt
    puts "Would you like to play again?"
    puts "Type 'y' for Yes or 'n' for No."
    play_again
  end

  def play_again
    response = gets.chomp.to_s.downcase
    if response == "y"
      Play.new
    elsif response == "n"
      puts "Thank you for playing, bye!"
      return
    else
      puts "That is not a valid answer, please try again or click 'CTRL + C' to exit"
      play_again
    end
  end

end
