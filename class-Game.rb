require_relative 'module-variables-class'

require 'pry'

#######################################################
#                     CLASS GAME                      #
#######################################################


class Game
  attr_accessor :players, :board
  include ModuleVariables
######------------------------------------------------------------------------------------######
#                 DEFINITION METHODES DE LA CLASSE GAME                #
######------------------------------------------------------------------------------------######

####------------ METHODE 1 : Initie le jeu ------------####

  def initialize
    puts "=================================================================="
    puts " Bienvenue dans le super morpion de la mort qui tue.."
    puts " ..the famous TIC-TAC-TOE !!!!! "
    puts ""
    puts @@board_empty
  end

end


#######################################################
#                     LANCEMENT JEU                   #
#######################################################

new_game = Game.new
# lancement d'un nouveau jeu
