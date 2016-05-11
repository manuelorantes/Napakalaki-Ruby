module NapakalakiGame

  class Prize
    def initialize(treasures, level)
      @treasures = treasures
      @level = level
    end

    def to_s
      "\n\tTesoros a ganar: #{@treasures}
      \tNiveles a ganar: #{@level}"
    end

    def getTreasures
      @treasures
    end

    def getLevel
      @level
    end

    #Esto son los consultores (getter), si quisiera los setter seria igual pero writer
    attr_reader :treasures, :level
  end
end
