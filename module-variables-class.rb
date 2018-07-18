require 'pry'

######------------------------------------------------------------------------------------######
#             CREATION DES VARIABLES UTILISEES DANS TOUTES LES CLASSES         #
######------------------------------------------------------------------------------------######
module ModuleVariables
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

 end