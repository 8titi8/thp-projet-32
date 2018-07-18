require 'pry'


def perform
  
  def launch_a_game
  	require_relative 'class-Game'
	require_relative 'class-Players'
	require_relative 'class-Board'
  end

  def launch_a_new_game
  	puts "=================================================================="
  	puts " Si vous voulez-vous relancer une partie, veuillez écrire 'ok' et apppuyer sur entrée, sinon appuyer sur n'importe quelle touche:"
  	print " > "
  	answer = gets.chomp.to_s
  	if answer == "ok"
  	  puts "Ok ? Alors c'est reparti !"
  	  launch_a_game
  	else
      puts "=================================================================="
  	  puts " Merci d'avoir joué !\n A bientôt pour une nouvelle partie ;)"  		
  	end
  	return puts launch_a_game
  end


   launch_a_game
   launch_a_new_game



end

perform

