require 'class-Game'
require 'class-Players'
require 'class-Boardcases'
require 'pry'


class Board

  def initialize
    @boardcases = 9.times.collect { Boardcase.new }
    puts @board = "\n         #{@boardcases_1} | #{@boardcase_2} | #{@boardcase_3} \n        ---------\n         #{@boardcase_4} | #{@boardcase_5} | #{@boardcase_6} \n        ---------\n         #{@boardcase_7} | #{@boardcase_8} | #{@boardcase_9}\n"
    return @board
  end

end