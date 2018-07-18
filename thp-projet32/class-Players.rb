require_relative 'class-Game'
require_relative 'module-variables-class'

require 'pry'

class Players
  include ModuleVariables

  def initialize
  	#super
    puts ""
    puts "=================================================================="
    puts " Bonjour, le morpion se joue à deux !"
    puts "------------------------------------------------------------------"
    puts " Quel est le nom du premier joueur ?"
    print " > "
    player_1 = gets.chomp.to_s.capitalize
    # on demande le nom du joueur 1
    @@players << player_1
    # on place le nom du joueur dans le tableau @@players
    puts "------------------------------------------------------------------"
    puts " Bonjour #{player_1}, quel est le nom de votre adversaire ?"
    print " > "
    player_2 = gets.chomp.to_s.capitalize
    # on demande le nom du joueur 2
    @@players << player_2
    # on place le nom du joueur dans le tableau @@players
    puts "------------------------------------------------------------------"
    puts " Bonjour #{player_2} ! Commençons à jouer :)"
    puts "------------------------------------------------------------------"
    return
  end

end

Players.new
# creation d'une instance Players qui va initie l'ajout de deux joueurs au jeu