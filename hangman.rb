require 'yaml'

class Hangman
  MAX_GUESSES = 6
  DICTIONARY = "dictionary.txt"

  def initialize(load_game = false)
    load_game ? load_saved_game : new_game
  end

  def new_game
    lines = File.readlines(DICTIONARY)
    words= lines.map do |line|
      line.chomp
    end
    @secret_word = words.select { |w| w.length.between?(5,12) }.sample
     @correct_letters = []
     @wrong_letters = []
     @remaining_guesses = MAX_GUESSES
  end

  def play
    until game_over?
      display_status
      take_turn
    end
    end_game_message
  end

  def display_status
    puts "\nWord: " +
     @secret_word.chars.map { |c| @correct_letters.include?(c) ? c : "_"}.join(" ")
    puts "Wrong guesses: #{@wrong_letters.join(', ')}"
    puts "Remaining guesses: #{@remaining_guesses}"
  end

  def take_turn
    print "Guess a letter or type 'save': "
    input = gets.chomp.downcase

    if input == "save"
      save_game
      exit
    end

    return puts("Invalid guess.") unless valid_guess?(input)
    process_guess(input)
  end

  def valid_guess?(letter)
    letter.match?(/^[a-z]$/) &&
    !@correct_letters.include?(letter) &&
    !@wrong_letters.include?(letter)
  end

  def process_guess(letter)
    if @secret_word.include?(letter)
      @correct_letters << letter
    else
      @wrong_letters << letter
      @remaining_guesses -= 1
    end
  end

  def game_over?
    @remaining_guesses.zero? ||
    (@secret_word.chars - @correct_letters).empty?
  end

  def end_game_message
    puts @remaining_guesses > 0 ?
      "You won! Word: #{@secret_word}" :
      "You lost! Word: #{@secret_word}"
  end

  def save_game
    File.write("save.yml", YAML.dump(self))
    puts "Game saved"
  end

  def load_saved_game
    data = YAML.load_file("save.yml", permitted_classes: [Hangman])
    @secret_word = data.instance_variable_get(:@secret_word)
    @correct_letters = data.instance_variable_get(:@correct_letters)
    @wrong_letters = data.instance_variable_get(:@wrong_letters)
    @remaining_guesses = data.instance_variable_get(:@remaining_guesses)
  end
end

puts "1. New Game"
puts "2. Load Game"
choice = gets.chomp

game = choice == "2" && File.exist?("save.yml") ? Hangman.new(true) : Hangman.new
game.play