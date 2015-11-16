class TicTacToe
  def initialize
    @game_board_array = (0..8).to_a.map { |e| greyify("#{e}")}
  end

  def greyify(string)
    "\e[37m#{string}\e[0m"
  end

  def greenify(string)
    "\e[32m#{string}\e[0m"
  end

  def game_board
    puts "\n  #{@game_board_array[0]}|#{@game_board_array[1]}|#{@game_board_array[2]}\n  #{@game_board_array[3]}|#{@game_board_array[4]}|#{@game_board_array[5]}\n  #{@game_board_array[6]}|#{@game_board_array[7]}|#{@game_board_array[8]}\n\n"
  end

  def winning_combo
    arr = @game_board_array
    winning_array = []
    winning_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    winning_combos.each do |array|
      if arr[array[0]] == arr[array[1]] && arr[array[1]] == arr[array[2]]
        winning_array = array
      end
    end
    winning_array.empty? ? false : winning_array
  end

  def game
    unless game_end
      game_board
      get_player_one_choice
      player_one_choice
    end
    unless game_end
      game_board
      get_player_two_choice
      player_two_choice
    end
  end

  def game_end
    if winning_combo
      winners = winning_combo
      @game_board_array = @game_board_array.each_with_index.map do |e, i|
        winners.include?(i) ? greenify(e) : e
      end
      "We have a winner!"
    elsif @game_board_array.all? { |e| e == "X" || e == "O" }
      "Game over. No winner."
    else
      false
    end
  end

  def get_player_one_choice
    print "Player One >> "
    @player_one = gets.chomp.to_i
    if @game_board_array[@player_one] == "O"
      puts "You can't go there! Try again."
      get_player_one_choice
    end
  end

  def get_player_two_choice
    print "Player Two >> "
    @player_two = gets.chomp.to_i
    if @game_board_array[@player_two] == "X"
      puts "You can't go there! Try again."
      get_player_two_choice
    end
  end

  def player_one_choice
    @game_board_array[@player_one] = "X" unless @game_board_array[@player_one] == "O"
  end

  def player_two_choice
    @game_board_array[@player_two] = "O" unless @game_board_array[@player_two] == "X"
  end
end

# Round 0
play = TicTacToe.new

while play.game_end == false
  play.game
end

play.game_board
puts play.game_end