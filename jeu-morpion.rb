require 'pry'

################################################################################################

class Game
  attr_accessor :players, :board
  @@players = []
  @@array_names_boardcases = ["A1", "A2", "A3","B1", "B2", "B3", "C1", "C2", "C3"]
  # creation du tableau de toutes les réponses possibles
  @@array_possibilities_victory = [
                        ["A1", "A2", "A3"], ["B1", "B2", "B3"], ["C1", "C2", "C3"],
                        ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"],
                        ["A1", "B2", "C3"], ["A3", "B2", "C1"]
                      ]
  #creation du tableau contenant toutes les possibilités de victoire
  @@board = "       1   2   3\n\n    A    #{@boardcase_1} | #{@boardcase_2} | #{@boardcase_3} \n       ---|--|---\n    B    #{@boardcase_4} | #{@boardcase_5} | #{@boardcase_6} \n       ---|--|---\n    C    #{@boardcase_7} | #{@boardcase_8} | #{@boardcase_9}\n"
  @@player_1_symbol = "x"
  @@player_2_symbol = "o"
  @@players_symbol = []
  @@players_symbol << @@player_1_symbol
  @@players_symbol << @@player_2_symbol

  @@choices_player_1 = []
  @@choices_player_2 = []
  @@choices_both_players = []
  @@choices_both_players << @@choices_player_1
  @@choices_both_players << @@choices_player_2

  def initialize
    puts "=================================================================="
    puts " Bienvenue dans le super morpion de la mort qui tue.."
    puts " ..the famous TIC-TAC-TOE !!!!! "
    puts ""
    empty_board = Board.new
    Players.new
    empty_board.run_the_game
  end

  def play_tic_tac_toe(i)
 
    puts " #{@@players[i]}, veuillez choisir une case en indiquant la ligne puis la \n colonne de celle-ci. Par exemple, A1 !"
    print " > "
    choice_player = gets.chomp.to_s

    until @@array_names_boardcases.include?(choice_player)
      # tant que le joeur n'écrit pas le choix au bon format, on lui redemande de faire un choix
      puts " Attention #{@@players[i]}, veuillez choisir une case selon le format A1, B3.. !"
      puts " Si la case est déjà prise, veuillez remplir une case vide :"
      print " > "
      choice_player = gets.chomp.to_s
      #on demande au joueur une réponse
    end

    if i == 0
      @@choices_player_1 << choice_player

    else
      @@choices_player_2 << choice_player
 
    end
    puts "------------------------------------------------------------------"
    @@array_names_boardcases.delete(choice_player)

  end

  def is_winner?(choices_player, which_player)
  @@array_possibilities_victory.map do |mini_array|
      if (mini_array & choices_player).size == mini_array.size
        puts " Bravo #{which_player} ! Vous avez remporté la partie ! :)"
        return true
      false
      end
    end
  end

  def equality_game?
   if @@array_names_boardcases.empty?
     puts " Pas de victoire cette fois.. C'est un match nul !"
     return true
   false
   end
  end

  def run_the_game
  j = 1
      until is_winner?(@@choices_both_players[j], @@players[j]) == true || equality_game? == true
       
        if j == 0
          j += 1
       
        else j -= 1
       
        end
      
        play_tic_tac_toe(j)
     
      end
    puts "=================================================================="
    puts " Voilà, la partie est terminée !"
    puts " Merci d'avoir joué avec les morpions (en maillot) de Nice ! ;)"
    puts "=================================================================="

  end

end

################################################################################################

module Boardcase
  attr_accessor :status_boardcase

  def initialize
    @status_boardcase = " "
  end
  # a faire apres, essayer de changer le statut en écrivant une méthode spécifique
  end


################################################################################################

class Board < Game

  # appelle le module Boardcase
  include Boardcase

  def initialize
    # création d’un tableau avec 9 valeurs de 1 à 9
    @boardcases = 9.times.collect { Boardcase }
    # Afficher à chaque nouveau Board le dessin du morpion vide
    puts @@board
    # retourne le string qui permet d’afficher le dessin du morpion vide
    return @@board
  end


end

################################################################################################

class Players < Game

  def initialize
    puts ""
    puts "=================================================================="
    puts " Bonjour, le morpion se joue à deux !"
    puts "------------------------------------------------------------------"
    puts " Quel est le nom du premier joueur ?"
    print " > "
    player_1 = gets.chomp.to_s.capitalize
    # on demande le nom du joueur 1
    @@players << player_1
    # on place le nom du joueur dans un tableau
    puts "------------------------------------------------------------------"
    puts " Bonjour #{player_1}, quel est le nom de votre adversaire ?"
    print " > "
    player_2 = gets.chomp.to_s.capitalize
    # on demande le nom du joueur 2
    @@players << player_2
    # on place le nom du joueur dans un tableau
    puts "------------------------------------------------------------------"
    puts " Bonjour #{player_2} ! Commençons à jouer :)"
    puts "------------------------------------------------------------------"
    puts @board
    return
  end

end

################################################################################################

new_game = Game.new