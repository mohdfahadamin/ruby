class Game
  def color_generate
    @colors = ["red", "blue", "green", "yellow"]
    @guess = 
    Array.new(4) {
      @colors.sample
    }    
  end
  
  def play
    color_generate
    puts "You have to guess 4 color order in correct order.
The color can be repeated. You have only 3 guesses"
    i = 0
    while i<3
      puts "Tern no. #{i+1}: "
      puts "Colors: red, blue, green, yellow"
      puts "Enter 4 colors separated by space:"
      @input = gets.split
      puts "Guess: #{@input.join(' ')}"
      
      if @input == @guess
        puts "Sequence is correct"
        break
      else
        puts "Sequence is not correct"
      end
      i+=1
    end
    puts "\nSecret sequence was: #{@guess.join(' ')}"
  end
end
game=Game.new
game.play