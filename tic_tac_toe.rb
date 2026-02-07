class Board
  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts
    3.times do |i|
      puts " #{@cells[i*3]} | #{@cells[i*3+1]} | #{@cells[i*3+2]}"
      if i < 2 
        puts "---+---+---"
      end
    end
  end
  def update(position,symbol)
    if @cells[position] == " "
      @cells[position] = symbol
      true
    else
      false
    end
  end
  def full?
    !@cells.include?(" ")
  end

  def winner?(symbol)
    winning_combinations = [
      [0,1,2],[3,4,5],[6,7,8],
      [0,3,6],[1,4,7],[2,5,8],
      [0,4,8],[2,4,6]
    ]

    winning_combinations.any? do |combo|
      combo.all?{ |i| @cells[i] == symbol}
    end
  end
end

class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def make_move
    print "#{@name} (#{@symbol}), enter position (1-9): "
    gets.to_i - 1
  end
end

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new("Fahad", "X")
    @player2 = Player.new("Khan", "O")
    @current_player = @player1
  end

  def switch_turn
    @current_player = (@current_player ==@player1)? @player2 : @player1
  end

  def play
    loop do
      @board.display
      position = @current_player.make_move

      unless @board.update(position,@current_player.symbol)
        puts "Invalid move. Try again. "
        next
      end

      if @board.winner?(@current_player.symbol)
        @board.display
        puts "#{@current_player.name} wins!"      
        break  
      end

      if @board.full?
        @board.display
        puts "It's a draw!"
        break
      end

      switch_turn
    end
  end
end
game = Game.new
game.play