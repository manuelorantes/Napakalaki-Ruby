require_relative 'Player'
module NapakalakiGame
  class NumericBadConsequence < BadConsequence
    def initialize(text, level, v, h)
      super(text, level)
      @visible = v
      @hidden = h
    end

    def to_s
      super +
      "\n\tTesoros visibles: #{@visible}
      \tTesoros ocultos: #{@hidden}\n"
    end

    def isEmpty
      true if @visible == 0 && @hidden == 0
    end

    def getNVisibleTreasures
      @visible
    end

    def getNHiddenTreasures
      @hidden
    end


    def substractVisibleTreasure(t)
      @visible -= 1 if @visible != 0
    end

    def substractHiddenTreasure(t)
      @hidden -= 1 if @hidden != 0
    end


    def adjustToFitTreasureLists(v, h)
      if v.size < @visible
        new_v = v.size
      else
        new_v = @visible
      end

      if h.size < @hidden
        new_h = h.size
      else
        new_h = @hidden
      end

      bc = NumericBadConsequence.new(getName, getLevels, new_v, new_h)
      return bc
    end


  end
end
