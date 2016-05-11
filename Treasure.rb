require_relative 'TreasureKind'
module NapakalakiGame

  class Treasure
    public
    def initialize(n, bonus, t)
      @name = n
      @bonus = bonus
      @type = t
    end

    def to_s
      "#{@name} \tBonus: #{@bonus} \t #{@type} "
    end

    def getName
      @name
    end

    def getBonus
      @bonus
    end

    def getType
      @type
    end

  end
end
