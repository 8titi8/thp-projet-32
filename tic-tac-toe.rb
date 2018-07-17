require 'pry'

class Board
  attr_accessor :boardcases
    @@all_boardcase = []
    @board = ["|","|","\n","|","|","\n","|","|"]
binding.pry
  def initialize


  end

end

class Boardcase < Board
  attr_accessor :name_boardcase

  @@number = 0

  def initialize
      @name_boardcase = @@number + 1
      @@all_boardcase << @name_boardcase
      return @@number += 1
  end

end

boardcase_1 = Boardcase.new
boardcase_2 = Boardcase.new
boardcase_3 = Boardcase.new
boardcase_4 = Boardcase.new
boardcase_5 = Boardcase.new
boardcase_6 = Boardcase.new
boardcase_7 = Boardcase.new
boardcase_8 = Boardcase.new
boardcase_9 = Boardcase.new

empty_board = Board.new

p empty_board
