require_relative 'class-Game'
require_relative 'module-variables-class'
require_relative 'class-Boardcases'

require 'pry'

#######################################################
#                     CLASS BOARD                     #
#######################################################

class Board
  include ModuleVariables


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

empty_board = Board.new
# creation d'une instance Board qui initie un plateau de jeu
empty_board.run_the_game
# appel de la methode run_the_game qui lance le jeu
