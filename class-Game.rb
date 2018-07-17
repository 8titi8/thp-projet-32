require_relative 'class-Players'
require_relative 'class-Board'

require 'pry'

class Game
	attr_accessor :players, :board
	@@players = []

	def initialize
		puts "Bienvenue dans le super morpion de la mort qui tue.."
		puts "..the famous TIC-TAC-TOE !!!!! "
	end



end


new_game = Game.new
