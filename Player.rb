require_relative 'Treasure'
require_relative 'Dice'
require_relative 'BadConsequence'
require_relative 'CardDealer'
module NapakalakiGame

  class Player


    @@MAXLEVEL = 10

    public
    def initialize(name)
      @name = name
      @level = 1
      @dead = true
      @hiddenTreasures = []
      @visibleTreasures = []
      @pendingBadConsequence = nil
    end

    def newCopyPlayer(p)
      @name = p.getName
      @level = p.getLevels
      @dead = p.isDead
      @hiddenTreasures = p.getHiddenTreasures
      @visibleTreasures = p.getVisibleTreasures
      @pendingBadConsequence = p.getPendingBadConsequence
    end

    def to_s
      "#{@name} \t Nivel: #{@level} \t Fuerza de combate: #{getCombatLevel}"
    end

    def self.MAXLEVEL
      @@MAXLEVEL
    end

    def getName
      @name
    end

    def isDead
      @dead
    end

    def getHiddenTreasures
      @hiddenTreasures
    end

    def getVisibleTreasures
      @visibleTreasures
    end

    def combat(m)
      myLevel = getCombatLevel
      monsterLevel = getOponentLevel(m)

      if myLevel > monsterLevel
        applyPrize(m)
        if getLevels >= @@MAXLEVEL
          result = CombatResult::WINGAME
        else
          result = CombatResult::WIN
        end

      else
        applyBadConsequence(m)
        if shouldConvert
          result = CombatResult::LOSEANDCONVERT
        else
          result = CombatResult::LOSE
        end
      end
      return result
    end

    def makeTreasureVisible(t)
      canI = canMakeTreasureVisible(t)
      if(canI)
        @visibleTreasures<<t

        @hiddenTreasures.delete_at(@hiddenTreasures.find_index(t))
      end
    end

    def discardVisibleTreasure(t)
      @visibleTreasures.delete_at(@visibleTreasures.find_index(t))
      CardDealer.instance.giveTreasureBack(t)

      if @pendingBadConsequence != nil && !@pendingBadConsequence.isEmpty
        @pendingBadConsequence.substractVisibleTreasure(t)
      end
      dieIfNoTreasures
    end

    def discardHiddenTreasure(t)
      @hiddenTreasures.delete_at(@hiddenTreasures.find_index(t))
      CardDealer.instance.giveTreasureBack(t)

      if @pendingBadConsequence != nil && !@pendingBadConsequence.isEmpty
        @pendingBadConsequence.substractHiddenTreasure(t)
      end
      dieIfNoTreasures
    end

    def validState
      if @pendingBadConsequence != nil
        @pendingBadConsequence.isEmpty && @hiddenTreasures.size <= 4
      else
        @hiddenTreasures.size <= 4
      end
    end

    def initTreasures
      dealer = CardDealer.instance
      dice = Dice.instance
      bringToLife()
      treasure = dealer.nextTreasure
      @hiddenTreasures<<treasure
      number = dice.nextNumber

      if(number > 1)
        treasure = dealer.nextTreasure
        @hiddenTreasures<<treasure
      end
      if(number == 6)
        treasure = dealer.nextTreasure
        @hiddenTreasures<<treasure
      end
    end

    def getLevels
      @level
    end

    def getPendingBadConsequence
      @pendingBadConsequence
    end

    def discardAllTreasures
      visible = Array.new(@visibleTreasures)
      for t in visible
        discardVisibleTreasure(t)
      end

      hidden = Array.new(@hiddenTreasures)
      for t in hidden
        discardHiddenTreasure(t)
      end
    end


    #EXAMEN
    def setHiddenTreasures(h)
      @hiddenTreasures.clear
      for i in h
        @hiddenTreasures << i
      end

    end

    def setVisibleTreasures(h)
      @visibleTreasures.clear
      for i in h
        @visibleTreasures << i
      end

    end

    #FIN DE EXAMEN


    private
    def bringToLife
      @dead = false
    end

    def incrementLevels(l)
      if (@level + l) < 10
        @level += l
      else
        @level = 10
      end
    end

    def decrementLevels(l)
      @level = @level - l
      if @level <= 1
        @level = 1
        @dead = true
      end
    end

    def setPendingBadConsequence(b)
      @pendingBadConsequence = b
    end

    def applyPrize(m)
      nLevels = m.getLevelsGained
      incrementLevels(nLevels)
      nTreasures = m.getTreasuresGained

      if nTreasures > 0
        dealer = CardDealer.instance
        for n in (1..nTreasures)
          treasure = dealer.nextTreasure
          @hiddenTreasures<<treasure
        end

      end
    end

    def applyBadConsequence(m)
      badConsequence = m.getBadConsequence
      nLevels = badConsequence.getLevels
      decrementLevels(nLevels)
      pedingBad = badConsequence.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(pedingBad)
    end

    def canMakeTreasureVisible(t)
      if(t.getType() != TreasureKind::ONEHAND && t.getType() != TreasureKind::BOTHHANDS)
        for m in @visibleTreasures
          if(t.getType() == m.getType())
            return false
          end
        end
        return true
      end

      manos_ocupadas = 0
      for m in @visibleTreasures
        if(TreasureKind::ONEHAND == m.getType())
          manos_ocupadas += 1
        end
        if(TreasureKind::BOTHHANDS == m.getType())
          return false
        end
      end
      if (t.getType() == TreasureKind::ONEHAND)
        return (manos_ocupadas <= 1)
      end
      return (manos_ocupadas == 0)

    end

    def howManyVisibleTreasures(tKind)
      number = 0
      for m in visibleTreasures
        number += 1 if m.getType == tKind
      end
      return number
    end

    def dieIfNoTreasures
      @dead = true if @visibleTreasures.size == 0 && @hiddenTreasures == 0
    end


    protected
    def getOponentLevel(m)
      m.getCombatLevel
    end

    def shouldConvert
      dice = Dice.instance
      numero = dice.nextNumber
      return numero == 6
    end

    def getCombatLevel
      combatlevel = 0
      for m in @visibleTreasures
        combatlevel = combatlevel + m.getBonus
      end
       combatlevel = combatlevel + @level
    end

  end
end
