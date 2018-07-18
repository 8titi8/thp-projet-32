require_relative 'class-Game'
require_relative 'module-variables-class'

require 'pry'

#########################################################
#                     CLASS BOARDCASE                   #
#########################################################

class Boardcase
  attr_accessor :status
  include ModuleVariables

  def initialize
    @status = @@status_boardcase[0]
    # pour chaque instance boardcase créée mettre le status = " "
    @@all_status << @status
    # pour chaque instance créée ajouter le statut dans le tableau all_status
  end

 end

@A1 = Boardcase.new
@A2 = Boardcase.new
@A3 = Boardcase.new
@B1 = Boardcase.new
@B2 = Boardcase.new
@B3 = Boardcase.new
@C1 = Boardcase.new
@C2 = Boardcase.new
@C3 = Boardcase.new