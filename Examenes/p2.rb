require_relative 'Referee'
require_relative 'Monster'
require_relative 'Prize'
require_relative 'BadConsequence'


module P2
  class P2
    include NapakalakiGame

    def initialize
    end

    def self.examen
      prueba = Referee.getInstance
      puts prueba.judge(-1)
      puts prueba.judge(3)
      puts prueba.judge(7)


      #El rey de rosa
      badConsequence1 = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles.", 5, 3, 0)
      prize1 = Prize.new(4,2)
      Monster.new("El rey de rosa", 13, prize1, badConsequence1)

      #Byakhees de bonanza
      badConsequence2 = BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta.", 0,
        [TreasureKind::ARMOR], [TreasureKind::ARMOR] )
      prize2 = Prize.new(2,1)
      Monster.new("Byakhees de bonanza", 8, prize2, badConsequence2)

      #Chibithulhu
      badConsequence3 = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio te descartas de tu casco visible.", 0,
      [TreasureKind::HELMET], [])
      prize3 = Prize.new(1,1)
      Monster.new("Chibithulhu", 2, prize3, badConsequence3)

      puts Monster.getNumberOfMonsters
    end

  end

end
