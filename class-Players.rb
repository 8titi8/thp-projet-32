require_relative 'class-Game'
require 'pry'

class Players

	def get_players_names
		puts "Bonjour, le morpion se joue à deux. \n\n Quel est le nom du premier joueur ?"
		player_1 = gets.chomp.to_s
		
		puts "Bonjour #{player_1}, quel est le nom de votre adversaire ?"
		player_2 = gets.chomp.to_s
		puts "Bonjour #{player_2} ! Commençons à jouer :)"
		puts @board
		return
	end

end