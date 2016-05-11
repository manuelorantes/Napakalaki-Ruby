#EXAMEN

require './BadConsequence.rb'
require_relative 'Prize'
module NapakalakiGame

  class Monster

    @@Contador = 0

    def initialize(name, combatlevel, premio, bc, c_level)
      @name = name
      @combatLevel = combatlevel
      @prize = premio
      @bc = bc
      @levelChangeAgainstCultistPlayer = c_level
      @@Contador += 1
    end

    def to_s
      "\nNombre: #{@name} \nNivel de combate: #{@combatLevel}" +
      "\nNivel de combate contra Cultist: #{getCombatLevelAgainstCultistPlayer}\n\nBuen rollo: #{@prize} \n\nMal rollo: #{@bc}"
    end

    def Monster.newNoCultist(name, combatlevel, premio, bc)
      new(name, combatlevel, premio, bc, 0)
    end

    def Monster.newCultist(name, combatlevel, premio, bc, c_level)
      new(name, combatlevel, premio, bc, c_level)
    end

    def Monster.newMal_Rollo_Muerte(name, combatlevel, premio)
      bc = BadConsequence.newDeath("Estas muerto.")
      new(name, combatlevel, premio, bc, 0)
    end


    def self.getNumberOfMonsters
      @@Contador
    end


    def getName
      @name
    end

    def getCombatLevel
      @combatLevel
    end

    def getBadConsequence
      @bc
    end

    def getLevelsGained
      @prize.getLevel
    end

    def getTreasuresGained
      @prize.getTreasures
    end

    def getCombatLevelAgainstCultistPlayer
      getCombatLevel + @levelChangeAgainstCultistPlayer
    end

    attr_reader :name, :combatLevel, :prize, :bc
  end
end

#FIN DE EXAMEN
