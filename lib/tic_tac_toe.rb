require 'pry'
class TicTacToe

  attr_accessor :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    line = "-----------"
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts line
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts line
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def move(location, token="X")
    board[location-1] = token
  end

  def position_taken?(position)
    board[position] != " "
  end

  def valid_move?(input)
    location = input.to_i
    (1..9).include?(location) && !position_taken?(location-1)
  end

  def turn
    puts "Where would you like to go?"
    input = gets.strip
    if valid_move?(input)
      move (input.to_i)
    else
      puts "Not so fast budy, you can't go there."
      turn
    end
  end

  def turn_count
    board.inject(0) do | sum, space |
      space == " " ? sum : sum += 1
    end
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.find do | win_combo |
      win_combo[0] != " " &&
      win_combo[0] == win_combo[1] && win_combo[1] == win_combo[2]
    end
  end

end
