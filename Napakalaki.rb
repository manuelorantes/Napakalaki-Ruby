
require 'singleton'
require_relative 'Player'
require_relative 'Monster'
require_relative 'CardDealer'
require_relative 'CombatResult'
require_relative 'CultistPlayer'

module NapakalakiGame
  class Napakalaki

    include Singleton

    private
    def initialize
      @currentPlayerIndex = -1
      @currentPlayer = nil
      @players = []
      @dealer = CardDealer.instance
      @currentMonster = nil
    end

    def initPlayers(names)
      for n in names
        @players<<Player.new(n)
      end
    end

    def nextPlayer
      if @currentPlayerIndex == -1
        @currentPlayerIndex = rand(@players.size)
      else
        @currentPlayerIndex = (@currentPlayerIndex+1) %  @players.size
      end

      @currentPlayer = @players[@currentPlayerIndex]
      return @currentPlayer
    end

    def nextTurnAllowed
      return true if @currentPlayer == nil
      getCurrentPlayer.validState
    end

    public

    def getInstance
      inst = Napakalaki.instance
    end

    def developCombat
      aux = @currentPlayer.combat(@currentMonster)
      CardDealer.instance.giveMonsterBack(@currentMonster)
      if aux == CombatResult::LOSEANDCONVERT
        cultist = @dealer.nextCultist
        jugador_nuevo = CultistPlayer.new(@currentPlayer, cultist)
        @currentPlayer = jugador_nuevo
        @players[@currentPlayerIndex] = jugador_nuevo
      end
      return aux
    end

    def discardVisibleTreasures(treasures)
      for t in treasures
        @currentPlayer.discardVisibleTreasure(t)
      end
    end

    def discardHiddenTreasures(treasures)
      for t in treasures
        @currentPlayer.discardHiddenTreasure(t)
      end
    end

    def makeTreasuresVisible(treasures)
      for t in treasures
        @currentPlayer.makeTreasuresVisible(t)
      end
    end

    def initGame(players)
      initPlayers(players)
      @dealer.initCards
      nextTurn
    end

    def getCurrentPlayer
      @currentPlayer
    end

    def getCurrentMonster
      @currentMonster
    end

    def nextTurn
      stateOK = true
      if @currentPlayer != nil
        stateOK = nextTurnAllowed
      end
      if(stateOK)
        @currentMonster = @dealer.nextMonster()
        @currentPlayer = nextPlayer
        dead = @currentPlayer.isDead

        if dead
          @currentPlayer.initTreasures
        end
      end

      return stateOK
    end

    def endOfGame(result)
      result == CombatResult::WINGAME
    end

  end
end
#Pruebas
#juego = Napakalaki.instance


#FIN DE EXAMEN
