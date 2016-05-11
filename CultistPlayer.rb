module NapakalakiGame

  require_relative 'Cultist'

  class CultistPlayer < Player
    @@totalCultistPlayers = 0

    def initialize(p, c)
      newCopyPlayer(p)
      @myCultistCard = c
      @@totalCultistPlayers += 1
    end

    def to_s
      "Sectario #{@name} \t Nivel: #{@level} \t Fuerza de combate: #{getCombatLevel}"
    end

    protected
    def getCombatLevel
      (super + 0.5*super + (@myCultistCard.getGainedLevels * @@totalCultistPlayers)).to_i
    end


    def getOponentLevel(m)
      m.getCombatLevelAgainstCultistPlayer
    end

    def shouldConvert
      false
    end

    public
    def getTotalCultistPlayers
      return @@totalCultistPlayers
    end

  end
end
