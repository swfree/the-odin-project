class Hangman

  def initialize
    setup
  end

  def start
    puts "\n>>>> WELCOME TO HANGMAN <<<<"
    while true
      menu_selection = menu
      menu_action = execute_menu(menu_selection)
      break if menu_action == :quit
    end
    puts "Thank you for playing!"
  end

  def menu
    puts "\nPlease choose from the following options:\n\t1 - Play Hangman\n\t2 - Open Last Saved Game\n\t3 - Quit\n"
    gets.chomp.to_i
  end

  def execute_menu(selection)
    case selection
    when 1 then setup; play
    when 2 then load_saved_game; play
    when 3 then return :quit
    end
  end

  def setup
    fname = "5desk.txt"
    @word = ""
    until fits_char_limits?(@word)
      @word = pick_random_line(fname).chomp.downcase
    end
    @correct = []
    @incorrect = []
    @word.length.times { @correct << "-" }
    @max_incorrect = 8
  end

  def pick_random_line(file)
    random_line = File.readlines(file).sample
  end

  def fits_char_limits?(string)
    string.length > 4 && string.length < 12
  end

  def play
    while true
      break if game_over?
      guess = get_guess
      break if guess == "save"
      correct_guess?(guess) ? handle_correct(guess) : handle_incorrect(guess)
    end
    save_game if guess == "save"
  end

  def get_guess
    print "\nGuess a letter (or enter 'save' to save your progress) >> "
    gets.chomp.downcase
  end

  def correct_guess?(guess)
    @word.include?(guess)
  end

  def handle_correct(guess)
    guessed_correctly(guess)
    puts "That's correct!"
    feedback
  end

  def guessed_correctly(guess)
    @correct.each_with_index do |e, i|
      if guess == @word[i]
        @correct[i] = @word[i]
      end
    end
  end

  def feedback
    puts "\nProgress: #{@correct.join("")}\nIncorrect guesses: #{@incorrect.join("-")}\nYou have #{ @max_incorrect - @incorrect.length } incorrect guesses remaining."
  end

  def handle_incorrect(guess)
    @incorrect << guess
    puts "That's incorrect."
    feedback
  end

  def save_game
    status = [@word, @correct, @incorrect]
    File.open("save.yaml", "w") do |file|
      file.puts YAML::dump(status)
    end
  end

  def load_saved_game
    data = YAML::load(File.open("save.yaml"))
    @word = data[0]
    @correct = data[1]
    @incorrect = data[2]
    puts "You loaded your last saved game."
    feedback
  end

  def game_over?
    if @correct.join("") == @word
      puts "\nCongratulations, #{@word} is correct!"
      true
    elsif @incorrect.length == @max_incorrect
      puts "\nGame over, the word is #{@word}"
      true
    else
      false
    end
  end
end

require 'yaml'

game = Hangman.new
game.start