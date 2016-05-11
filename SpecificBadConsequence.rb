require_relative 'TreasureKind'
require_relative 'Player'

module NapakalakiGame
  class SpecificBadConsequence < BadConsequence
    def initialize(text, level, sv, sh)
      super(text, level)
      @specificVisible = sv
      @specificHidden = sh

    end

    def to_s
      super +
      "\n\tTesoros visibles especificos: #{@specificVisible}
      \tTesoros ocultos especificos: #{@specificHidden}\n"
    end

    def isEmpty
      true if @specificHidden.empty? && @specificVisible.empty?
    end

    def getSpecificHiddenTreasures
      @specificHidden
    end

    def getSpecificVisibleTreasures
      @specificVisible
    end

    def substractVisibleTreasure(t)
      if(@specificVisible != nil && !@specificVisible.empty?)
        aux = 0
        for tipo in @specificVisible
          if(tipo == t.getType)
            @specificVisible.delete_at(aux)
          end
          aux += 1
        end
      end
    end

    def substractHiddenTreasure(t)
      if(@specificHidden != nil && !@specificHidden.empty?)
        aux = 0
        for tipo in @specificHidden
          if(tipo == t.getType)
            @specificHidden.delete_at(aux)
          end
          aux += 1
        end
      end
    end


    def adjustToFitTreasureLists(v, h)
      new_s_v = []
      new_s_h = []

      aux_visible = Array.new(@specificVisible)
      for j in v
        esta = false
        for i in aux_visible
          if i == j.getType
            esta = true
            i = -1
          end
        end
        new_s_v<<j.getType if esta
      end

      aux_hidden = Array.new(@specificHidden)
      for j in h
        esta = false
        for i in aux_hidden
          if i == j.getType
            esta = true
            i = -1
          end
        end
        new_s_h<<j.getType if esta
      end

      bc = SpecificBadConsequence.new(getName, getLevels, new_s_v, new_s_h)
      return bc
    end
  end
end
