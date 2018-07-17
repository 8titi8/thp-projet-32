require 'class-Game'
require 'class-Players'
require 'class-Board'
require 'pry'

class Boardcase < Board
  attr_accessor :status_boardcase

  def initialize
    @status_boardcase = " "
  end

end