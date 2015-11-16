class Mastermind
  require './colorize_terminal.rb'

  def initialize
    arr = []
    colors = ["R","B","G","Y","C","P"]
    computer = []
    4.times { arr << rand(6) }
    arr.each { |x| computer << colors[x] }
    @master = computer
    @color_blocks = {"R" => "#{redb(" ")}", "Y" => "#{yellowb(" ")}", "G" => "#{greenb(" ")}", "C" => "#{cyanb(" ")}", "B" => "#{blueb(" ")}", "P" => "#{pinkb(" ")}"}
    @guesses = []
    @guesses_in_color = []
  end

  def instructions
    puts "LET'S PLAY #{boldg("MASTERMIND")}!"
    puts "\n*Options*\n#{@color_blocks.keys.join(" ")}\n#{@color_blocks.values.join(" ")}"
    puts "\n*Feedback*\n#{whiteb(" ")} Right Color, Wrong Spot\n#{blackb(" ")} Right Color, Right Spot\n\n"
  end

  def make_guess
    gets.chomp.upcase.split(//)
  end

  def array_to_color_blocks(array)
    ready = array.map { |e| @color_blocks[e] }
    ready.join(" ")
  end

  def display_rounds(i)
    1.upto(i+1) do |n|
      display_guess(n-1)
    end
  end

  def display_guess(i)
    puts i + 1 < 10 ? "Round #{i+1}:   #{@guesses_in_color[i]}" : "Round #{i+1}:  #{@guesses_in_color[i]}" 
  end

  def black_pegs(master, guess)
    for i in (0..3) do
      if guess[i] == master[i]
        master[i] = 'X'
        guess[i] = 'V'
      end
    end
    master
  end

  def white_pegs(master, guess)
    for i in (0..3) do
      if master.include?(guess[i])
        master[master.index(guess[i])] = 'O'
        guess[i] = 'Z'
      end
    end
    master
  end

  def get_feedback(m, g)
    mas = m.dup
    gue = g.dup
    feedback = []

    white_pegs(black_pegs(mas, gue), gue)
  end

  def print_feedback(array)
    feedback = []

    array.each do |e|
      if e == 'X'
        feedback << "#{blackb(" ")}"
      elsif e == 'O'
        feedback << "#{whiteb(" ")}"
      else
        next
      end
    end 
    feedback
  end

  def game_over?(i)
    if @guesses[i] == @master
      true
    elsif i == 11
      true
    else
      false
    end
  end

  def finished
    if @guesses.last == @master
      puts "\nCongratulations, #{boldg("YOU WON")}!\n"
    else
      puts "\nYou lost! Correct code is:\n#{array_to_color_blocks(@master)}"
    end
  end

  def round(i)
    # User makes a guess
    print "\nPlease take a guess, e.g. 'rygc' >> "
    @guesses[i] = make_guess

    # Convert to colors
    @guesses_in_color[i] = array_to_color_blocks(@guesses[i])
    
    # Display all rounds of guesses
    display_rounds(i)

    # Give user feedback
    user_feedback = get_feedback(@master, @guesses[i])
    puts "\nFeedback:  " + print_feedback(user_feedback).sort.join(" ")
  end

  def rounds
    12.times do |i|
      round(i)
      break if game_over?(i)
    end
  end
end

game = Mastermind.new
game.instructions
game.rounds
game.finished