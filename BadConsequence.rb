require_relative 'TreasureKind'
require_relative 'Player'

module NapakalakiGame

  class BadConsequence
    @@MAXTREASURES = 10
    #Esta variable la comparten todos los objetos creados de esta clase.
  #  @@numero_de_bc = 0
    def initialize(aText, someLevels)
      @text = aText
      @levels = someLevels
    #  @@numero_de_bc = @@numero_de_bc+1
    end

    def BadConsequence.newDeath(aText)
      new(aText, Player.MAXLEVEL, @@MAXTREASURES, @@MAXTREASURES, [], [])
    end

    def to_s
      "\n\t#{@text} \n\tNiveles que pierdes: #{@levels}"
    end

    
    def isEmpty
      raise NotImplementedError.new
    end

    def getLevels
      @levels
    end

    def getName
      @text
    end

    def self.MAXTREASURES
      @@MAXTREASURES
    end

    attr_reader :text, :levels, :visible, :hidden, :specificHidden, :specificVisible

  end
end

#jugador = NapakalakiGame::Player.new("ol")
#nomuerte = NapakalakiGame::BadConsequence.newLevelNumberOfTreasures("ol", 1, 1, 1)
#muereeeee = NapakalakiGame::BadConsequence.newDeath("Muerte!")
