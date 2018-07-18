require 'pry'

#################################################################################################
#                     CLASS GAME                      #
#################################################################################################

class Game
  attr_accessor :players, :board

######------------------------------------------------------------------------------------######
#             CREATION DES VARIABLES UTILISEES DANS TOUTES LES CLASSES         #
######------------------------------------------------------------------------------------######

  @@players = []
  # creation d'un tableau qui contiendra les deux joueurs player_1 et player_2

  @@array_names_boardcases_unchanged = ["A1", "A2", "A3","B1", "B2", "B3", "C1", "C2", "C3"]
  # creation d'un tableau avec toutes les valeurs des cases, tableau qui servira à placer les "x" et "o"
  # en cherchant l'index correspondant au choix fait par le joueur (voir plus bas)

  @@array_names_boardcases = ["A1", "A2", "A3","B1", "B2", "B3", "C1", "C2", "C3"]
  # creation du tableau de toutes les réponses possibles auquel on retirera les valeurs
  # déjà choisies à chaque tour, afin de ne pas autoriser deux fois le même choix

  @@array_possibilities_victory = [ #creation du tableau contenant toutes les possibilités de victoire
                        ["A1", "A2", "A3"], ["B1", "B2", "B3"], ["C1", "C2", "C3"],
                        ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"],
                        ["A1", "B2", "C3"], ["A3", "B2", "C1"]
                      ]
  

  @@board_empty = "       1   2   3\n\n    A    #{@A1} | #{@A2}  | #{@A3} \n       ---|---|---\n    B    #{@B1} | #{@B2}  | #{@B3} \n       ---|---|---\n    C    #{@C1} | #{@C2}  | #{@C3}\n"
  # creation du dessin pour jouer au morpion, qui sera appelé seulement lors de l'initialisation du jeu

  @@status_boardcase = [" ", "x", "o"]
  # creation d'un tableau contenant les différents statuts possibles pour la case

  @@all_status = []
 
  @@player_1_symbol = @@status_boardcase[1]
  @@player_2_symbol = @@status_boardcase[2]
  # creation de deux variables de classe qui attribuent chaque symbole à un joueur, 
  # selon l'index du statut de la case

  @@players_symbol = [@@player_1_symbol, @@player_2_symbol]
  # creation d'un tableau contenant deux tableaux avec les symboles de chaque joueur

  @@choices_player_1 = []
  @@choices_player_2 = []
  @@choices_both_players = [@@choices_player_1, @@choices_player_2]
  # crceation d'un tableau contenant deux tableaux avec les choix des joueurs qui
  # seront ajoutés à chaque tour

######------------------------------------------------------------------------------------######
#                 DEFINITION METHODES DE LA CLASSE GAME                #
######------------------------------------------------------------------------------------######

####------------ METHODE 1 : Initie le jeu ------------####

  def initialize
    puts "=================================================================="
    puts " Bienvenue dans le super morpion de la mort qui tue.."
    puts " ..the famous TIC-TAC-TOE !!!!! "
    puts ""
    empty_board = Board.new
    # creation d'une instance Board qui initie un plateau de jeu
    Players.new
    # creation d'une instance Players qui va initie l'ajout de deux joueurs au jeu
    empty_board.run_the_game
    # appel de la methode run_the_game qui lance le jeu
  end


####------------ METHODE 2 : fait jouer les deux joueurs ------------####

  def play_tic_tac_toe(i)
 
    puts " #{@@players[i]}, veuillez choisir une case en indiquant la ligne puis la \n colonne de celle-ci. Par exemple, A1 !"
    print " > "
    choice_player = gets.chomp.to_s
    # on demande au joueur 1 de faire un choix de case

    until @@array_names_boardcases.include?(choice_player)
      # tant que le joeur n'écrit pas le choix au bon format, on lui redemande de faire un choix
      puts " Attention #{@@players[i]}, veuillez choisir une case selon le format A1, B3.. !"
      puts " Si la case est déjà prise, veuillez remplir une case vide :"
      print " > "
      choice_player = gets.chomp.to_s
      #on demande au joueur une nouvelle réponse
    end

    if i == 0
    #si l'index actuel est 0, alors :
      @@choices_player_1 << choice_player
      # ajoute dans le tableau des choix du joueur 1 son nouveau choix
      change_status(@@choices_player_1, @@player_1_symbol)
      # appelle la méthode change_status pour ajouter "x" sur le dessin du morpion
    else
      #si l'index actuel n'est pas 0, alors :
      @@choices_player_2 << choice_player
      # ajoute dans le tableau des choix du joueur 2 son nouveau choix
      change_status(@@choices_player_2, @@player_2_symbol)
      # appelle la méthode change_status pour ajouter "o" sur le dessin du morpion
    end
    puts "------------------------------------------------------------------"
    @@array_names_boardcases.delete(choice_player)
    # efface le choix fait par le joueur à l'instant t du tableau
    # afin d'éviter qu'il puisse faire ce choix de nouveau

  end


####------------ METHODE 3 : determine si un joueur est gagnant ------------####

  def is_winner?(choices_player, which_player)
  @@array_possibilities_victory.map do |mini_array|
  # pour chaque élément du tableau array_possibilities_victory faire :
      if (mini_array & choices_player).size == mini_array.size
      # si la taille du tableau correspondant à l'intersection de chaque ['sous-tableau']
      # avec le [tableau de choix du joueur] correspond à la taille du [sous-tableau]
      # (cad à la taille de la combianison gagnante testée) renvoyer :
        puts " Bravo #{which_player} ! Vous avez remporté la partie ! :)"
        return true
        # si la condition est vérifiée, renvoyer le boléen true
      false
      # si la condition n'est pas vérifiée, renvoyer le boléen false
      end
    end
  end


####------------ METHODE 4 : détermine si c'est un match nul ------------####

  def equality_game?
   if @@array_names_boardcases.empty?
   # si le tableau des valeurs des cases est vide, alors :
     puts " Pas de victoire cette fois.. C'est un match nul !"
     return true
     # si condition vérifiée, renvoyer true
   false
   # si condition pas vérifiée, renvoyer false
   end
  end


 ####------------ METHODE 5 : change le statut de la case entre " "/"x"/"o"------------####
 ####------------  et affiche nouveau dessin morpion rempli  ------------####

  def change_status(array_choice_player, symbol_player)
  id_boardcase = array_choice_player.last 
  # creation variable locale qui choisit le dernier element du tableau des choix du joueur donné, ex => "A1"
  the_index = @@array_names_boardcases_unchanged.find_index(id_boardcase)
  # creation variable locale qui obtient le numéro d'index dans le tableau array_names_boardcases_unchanged
  # correspondant à la valeur de la variable id_boardcase => 0
    @@all_status[the_index] = symbol_player
    # dans le tableau all_status, change la valeur " " par le symbol player à l'index indiqué par the_index
    puts @@draw_board_completed = "       1   2   3\n\n    A   #{@@all_status[0]} | #{@@all_status[1]} | #{@@all_status[2]} \n       ---|---|---\n    B   #{@@all_status[3]} | #{@@all_status[4]} | #{@@all_status[5]} \n       ---|---|---\n    C   #{@@all_status[6]} | #{@@all_status[7]} | #{@@all_status[8]}\n"
    # affiche le nouveau dessin de morpion à chaque tour de joueur
  end


####------------ METHODE 6 : lance le jeu et arrête le jeu si gagnant ou match nul ------------####

  def run_the_game
  j = 1
  # variable locale
      until is_winner?(@@choices_both_players[j], @@players[j]) == true || equality_game? == true
      # jusqu'à ce que méthode is_winner? renvoie true OU méthode equality_game? renvoie true, faire:
        if j == 0
          j += 1
          # incrémenter de 1 la valeur d'index pour changer de joueur 1 à joueur 2
          # car index 1 du tableau @@players <=> joueur 2
        else j -= 1
          # revenir au joueur 1
          # car index 0 du tableau @@players <=> joueur 1         
        end
        play_tic_tac_toe(j)
        # a chaque tour appelle la méthode, et donc fait jouer les joueurs
      end
    puts "=================================================================="
    puts " Voilà, la partie est terminée !"
    puts " Merci d'avoir joué avec les morpions (en maillot) de Nice ! ;)"
    puts "=================================================================="
    # si la boucle se termine affiche ci-dessus
  end

end

#################################################################################################
#                     CLASS BOARDCASE                   #
#################################################################################################
class Boardcase < Game
  attr_accessor :status

  def initialize
    @status = @@status_boardcase[0]
    # pour chaque instance boardcase créée mettre le status = " "
    @@all_status << @status
    # pour chaque instance créée ajouter le statut dans le tableau all_status
  end

 end


#################################################################################################
#                     CLASS BOARD                     #
#################################################################################################

class Board < Game

  def initialize
    @A1 = Boardcase.new
    @A2 = Boardcase.new
    @A3 = Boardcase.new
    @B1 = Boardcase.new
    @B2 = Boardcase.new
    @B3 = Boardcase.new
    @C1 = Boardcase.new
    @C2 = Boardcase.new
    @C3 = Boardcase.new
    # crée 9 nouvelles instances Boardcase
    puts @@board_empty
    # affiche le dessin du morpion initial
  end

end

#################################################################################################
#                     CLASS PLAYERS                   #
#################################################################################################

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

################################################################################################

new_game = Game.new