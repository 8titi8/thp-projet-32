require_relative 'class-Boardcases'
require_relative 'class-Game'

class Board < Game
  
  # appelle le module Boardcase
  include Boardcase

  def initialize
  	# création d'un tableau avec 9 valeurs de 1 à 9
  	@boardcases = 9.times.collect { Boardcase }
  	# Afficher à chaque nouveau Board le dessin du morpion vide
    puts @board = "\n         #{@boardcases_1} | #{@boardcase_2} | #{@boardcase_3} \n        ---------\n         #{@boardcase_4} | #{@boardcase_5} | #{@boardcase_6} \n        ---------\n         #{@boardcase_7} | #{@boardcase_8} | #{@boardcase_9}\n"
  	# retourne le string qui permet d'afficher le dessin du morpion vide
  	return @board
  end

end

empty_board = Board.new