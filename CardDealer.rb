require 'singleton'
require_relative 'Monster'
require_relative 'Treasure'
require_relative 'Cultist'
require_relative 'BadConsequence'
require_relative 'NumericBadConsequence'
require_relative 'SpecificBadConsequence'
require_relative 'DeathBadConsequence'

module NapakalakiGame

  class CardDealer

    include Singleton

    private
    def initialize
      @unusedTreasures = []
      @usedTreasures = []
      @usedMonsters = []
      @unusedMonsters = []
      @unusedCultists = []
    end

    def initTreasureCardDeck
      #zona de Pruebas


      #fin de zona de pruebas

      @unusedTreasures<<Treasure.new("¡Si mi amo!", 4,TreasureKind::HELMET)
      @unusedTreasures<<Treasure.new("Fez alopodo", 3,TreasureKind::HELMET)
      @unusedTreasures<<Treasure.new("Casco minero", 2,TreasureKind::HELMET)
      @unusedTreasures<<Treasure.new("Necrotelecom", 2,TreasureKind::HELMET)
      @unusedTreasures<<Treasure.new("Tentaculo de pega", 2,TreasureKind::HELMET)
      @unusedTreasures<<Treasure.new("Capucha de Cthulhu", 3,TreasureKind::HELMET)
      @unusedTreasures<<Treasure.new("Porra preternatural", 1,TreasureKind::HELMET)
      @unusedTreasures<<Treasure.new("Zapato deja-amigos", 1,TreasureKind::SHOES)
      @unusedTreasures<<Treasure.new("Botas de investigacion", 3,TreasureKind::SHOES)
      @unusedTreasures<<Treasure.new("A prueba de babas", 2,TreasureKind::ARMOR)
      @unusedTreasures<<Treasure.new("La rebeca metalica", 2,TreasureKind::ARMOR)
      @unusedTreasures<<Treasure.new("Camiseta de la UGR", 1,TreasureKind::ARMOR)
      @unusedTreasures<<Treasure.new("El aparato de Pr. Tesla", 4,TreasureKind::ARMOR)
      @unusedTreasures<<Treasure.new("Insecticida ", 2,TreasureKind::ONEHAND)
      @unusedTreasures<<Treasure.new("Necro-comicon", 1,TreasureKind::ONEHAND)
      @unusedTreasures<<Treasure.new("Necro-gnomicon", 2,TreasureKind::ONEHAND)
      @unusedTreasures<<Treasure.new("Necro-playboycon", 3,TreasureKind::ONEHAND)
      @unusedTreasures<<Treasure.new("Garabato mistico", 2,TreasureKind::ONEHAND)
      @unusedTreasures<<Treasure.new("Hacha prehistorica", 2,TreasureKind::ONEHAND)
      @unusedTreasures<<Treasure.new("Mazo de los antiguos", 3,TreasureKind::ONEHAND)
      @unusedTreasures<<Treasure.new("Varita de atizamiento", 3,TreasureKind::ONEHAND)
      @unusedTreasures<<Treasure.new("Cuchillo de sushi arcano", 2,TreasureKind::ONEHAND)
      @unusedTreasures<<Treasure.new("Clavo de rail ferroviario", 3,TreasureKind::ONEHAND)
      @unusedTreasures<<Treasure.new("Gaita", 4,TreasureKind::BOTHHANDS)
      @unusedTreasures<<Treasure.new("Shogulador", 1,TreasureKind::BOTHHANDS)
      @unusedTreasures<<Treasure.new("Lanzallamas", 4,TreasureKind::BOTHHANDS)
      @unusedTreasures<<Treasure.new("Necronomicon", 5,TreasureKind::BOTHHANDS)
      @unusedTreasures<<Treasure.new("Linterna a dos manos", 3,TreasureKind::BOTHHANDS)
      @unusedTreasures<<Treasure.new("Escopeta de 3 cañones", 4,TreasureKind::BOTHHANDS)
      @unusedTreasures<<Treasure.new("Botas de lluvia acida", 1,TreasureKind::BOTHHANDS)
      @unusedTreasures<<Treasure.new("Ametralladora Thompson", 4,TreasureKind::BOTHHANDS)
    end

    def initMonsterCardDeck
=begin
      #zona de Pruebas

            #Familia feliz
            badConsequence15 = BadConsequence.newDeath("La familia te atrapa. Estás muerto.")
            prize15 = Prize.new(4,1)
            @unusedMonsters<<Monster.newNoCultist("Familia feliz", 1, prize15, badConsequence15)
            #Pollipólipo volante
            badConsequence13 = BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
            prize13 = Prize.new(1,1)
            @unusedMonsters<<Monster.newNoCultist("Pollipólipo volante", 3, prize13, badConsequence13)

            #Felpuggoth
            badConsequence_cultist5 = BadConsequence.newLevelSpecificTreasures("Pierdes tu casco y tu armadura visible. Pierdes tus manos" +
            " ocultas.", 0, [TreasureKind::HELMET, TreasureKind::ARMOR], [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS,TreasureKind::BOTHHANDS,TreasureKind::BOTHHANDS,TreasureKind::BOTHHANDS])
            prize_cultist5 = Prize.new(1,1)
            @unusedMonsters<<Monster.newCultist("Felpuggoth", 2, prize_cultist5, badConsequence_cultist5, 5)

            #Felpuggoth
            badConsequence_cultist5 = BadConsequence.newLevelSpecificTreasures("Pierdes tu casco y tu armadura visible. Pierdes tus manos" +
            " ocultas.", 0, [TreasureKind::HELMET, TreasureKind::ARMOR], [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS,TreasureKind::BOTHHANDS,TreasureKind::BOTHHANDS,TreasureKind::BOTHHANDS])
            prize_cultist5 = Prize.new(1,1)
            @unusedMonsters<<Monster.newCultist("Felpuggoth", 2, prize_cultist5, badConsequence_cultist5, -1)



      #fin de zona de pruebas
=end


      #Meto los monstrous

      #El rey de rosa
      badConsequence1 = NumericBadConsequence.new("Pierdes 5 niveles y 3 tesoros visibles.", 5, 3, 0)
      prize1 = Prize.new(4,2)
      @unusedMonsters<<Monster.newNoCultist("El rey de rosa", 13, prize1, badConsequence1)

      #Byakhees de bonanza
      badConsequence2 = SpecificBadConsequence.new("Pierdes tu armadura visible y otra oculta.", 0,
        [TreasureKind::ARMOR], [TreasureKind::ARMOR] )
      prize2 = Prize.new(2,1)
      @unusedMonsters<<Monster.newNoCultist("Byakhees de bonanza", 8, prize2, badConsequence2)

      #Chibithulhu
      badConsequence3 = SpecificBadConsequence.new("Embobados con el lindo primigenio te descartas de tu casco visible.", 0,
      [TreasureKind::HELMET], [])
      prize3 = Prize.new(1,1)
      @unusedMonsters<<Monster.newNoCultist("Chibithulhu", 2, prize3, badConsequence3)

      #El sopor de Dunwich
      badConsequence4 = SpecificBadConsequence.new("El primordial bostezo contagioso. Pierdes el calzado visible.", 0,
      [TreasureKind::SHOES], [])
      prize4 = Prize.new(1,1)
      @unusedMonsters<<Monster.newNoCultist("El sopor de Dunwich", 2, prize4, badConsequence4)

      #Ángeles de la noche ibicenca
      badConsequence5 = SpecificBadConsequence.new("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo." +
      " Descarta 1 mano visible y 1 mano oculta.", 0,
      [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
      prize5 = Prize.new(4,1)
      @unusedMonsters<<Monster.newNoCultist("Ángeles de la noche ibicenca", 14, prize5, badConsequence5)

      #El gorrón en el umbral
      badConsequence6 = NumericBadConsequence.new("Pierdes todos tus tesoros visibles.", 0, BadConsequence.MAXTREASURES, 0)
      prize6 = Prize.new(3,1)
      @unusedMonsters<<Monster.newNoCultist("El gorrón en el umbral", 10, prize6, badConsequence6)

      #H.P. Munchcraft
      badConsequence7 = SpecificBadConsequence.new("Pierdes la armadura visible.", 0,[TreasureKind::ARMOR], [])
      prize7 = Prize.new(2,1)
      @unusedMonsters<<Monster.newNoCultist("H.P. Munchcraft", 6, prize7, badConsequence7)

      #Bichgooth
      badConsequence8 = SpecificBadConsequence.new("Sientes bichos bajo la ropa. Descarta la armadura visible.", 0,
      [TreasureKind::ARMOR], [])
      prize8 = Prize.new(1,1)
      @unusedMonsters<<Monster.newNoCultist("Bichgooth", 2, prize8, badConsequence8)

      #La que redacta en las tinieblas
      badConsequence9 = NumericBadConsequence.new("Toses los pulmones y pierdes 2 niveles.", 2, 0, 0)
      prize9 = Prize.new(1,1)
      @unusedMonsters<<Monster.newNoCultist("La que redacta en las tinieblas", 2, prize9, badConsequence9)

      #Los hondos
      badConsequence10 = DeathBadConsequence.new("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto.")
      prize10 = Prize.new(2,1)
      @unusedMonsters<<Monster.newNoCultist("Los hondos", 8, prize10, badConsequence10)

      #Semillas Cthulhu
      badConsequence11 = NumericBadConsequence.new("Pierdes 2 niveles y 2 tesoros ocultos.", 2, 0, 2)
      prize11 = Prize.new(2,1)
      @unusedMonsters<<Monster.newNoCultist("Semillas Cthulhu", 4, prize11, badConsequence11)

      #Dameargo
      badConsequence12 = SpecificBadConsequence.new("Te intentas escaquear. Pierdes una mano visible.", 0,
      [TreasureKind::ONEHAND], [])
      prize12 = Prize.new(2,1)
      @unusedMonsters<<Monster.newNoCultist("Dameargo", 1, prize12, badConsequence12)

      #Pollipólipo volante
      badConsequence13 = NumericBadConsequence.new("Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
      prize13 = Prize.new(1,1)
      @unusedMonsters<<Monster.newNoCultist("Pollipólipo volante", 3, prize13, badConsequence13)

      #Yskhtihyssg-Goth
      badConsequence14 = DeathBadConsequence.new("No le hace gracia que pronuncien mal su nombre. Estas muerto.")
      prize14 = Prize.new(3,1)
      @unusedMonsters<<Monster.newNoCultist("Yskhtihyssg-Goth", 12, prize14, badConsequence14)

      #Familia feliz
      badConsequence15 = DeathBadConsequence.new("La familia te atrapa. Estás muerto.")
      prize15 = Prize.new(4,1)
      @unusedMonsters<<Monster.newNoCultist("Familia feliz", 1, prize15, badConsequence15)

      #Roboggoth
      badConsequence16 = SpecificBadConsequence.new("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro " +
      "2 manos visible.", 2,[TreasureKind::BOTHHANDS], [])
      prize16 = Prize.new(2,1)
      @unusedMonsters<<Monster.newNoCultist("Roboggoth", 8, prize16, badConsequence16)

      #El espia
      badConsequence17 = SpecificBadConsequence.new("Te asusta en la noche. Pierdes un casco visible.", 0,
      [TreasureKind::HELMET], [])
      prize17 = Prize.new(1,1)
      @unusedMonsters<<Monster.newNoCultist("El espia", 5, prize17, badConsequence17)

      #El Lenguas
      badConsequence18 = NumericBadConsequence.new("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
      prize18 = Prize.new(1,1)
      @unusedMonsters<<Monster.newNoCultist("El Lenguas", 20, prize18, badConsequence18)

      #Bicéfalo
      badConsequence19 = SpecificBadConsequence.new("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros " +
      "visibles de las manos.", 3,
      [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS], [])
      prize19 = Prize.new(1,1)
      @unusedMonsters<<Monster.newNoCultist("Bicéfalo", 20, prize19, badConsequence19)



      #El mal indecible impronunciable
      badConsequence_cultist1 = SpecificBadConsequence.new("Pierdes 1 mano visible", 0,
      [TreasureKind::ONEHAND], [])
      prize_cultist1 = Prize.new(3,1)
      @unusedMonsters<<Monster.newCultist("El mal indecible impronunciable", 10, prize_cultist1, badConsequence_cultist1, -2)

      #Testigos Oculares
      badConsequence_cultist2 = NumericBadConsequence.new("Pierdes tus tesoros visibles. Jajaja.", 0, 10, 0)
      prize_cultist2 = Prize.new(2,1)
      @unusedMonsters<<Monster.newCultist("Testigos Oculares", 6, prize_cultist2, badConsequence_cultist2, 2)

      #El gran cthulhu
      badConsequence_cultist3 = DeathBadConsequence.new("Hoy no es tu dı́a de suerte. Mueres.")
      prize_cultist3 = Prize.new(2,5)
      @unusedMonsters<<Monster.newCultist("El gran cthulhu", 20, prize_cultist3, badConsequence_cultist3, 4)

      #Serpiente Polı́tico
      badConsequence_cultist4 = NumericBadConsequence.new("Tu gobierno te recorta 2 niveles.", 2, 0, 0)
      prize_cultist4 = Prize.new(2,1)
      @unusedMonsters<<Monster.newCultist("Serpiente Polı́tico", 8, prize_cultist4, badConsequence_cultist4, -2)

      #Felpuggoth
      badConsequence_cultist5 = SpecificBadConsequence.new("Pierdes tu casco y tu armadura visible. Pierdes tus manos" +
      " ocultas.", 0, [TreasureKind::HELMET, TreasureKind::ARMOR], [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS,TreasureKind::BOTHHANDS,TreasureKind::BOTHHANDS,TreasureKind::BOTHHANDS])
      prize_cultist5 = Prize.new(1,1)
      @unusedMonsters<<Monster.newCultist("Felpuggoth", 2, prize_cultist5, badConsequence_cultist5, 5)

      #Shoggoth
      badConsequence_cultist6 = NumericBadConsequence.new("Pierdes 2 niveles", 2, 0, 0)
      prize_cultist6 = Prize.new(4,2)
      @unusedMonsters<<Monster.newCultist("Shoggoth", 16, prize_cultist6, badConsequence_cultist6, -4)

      #Lolitagooth
      badConsequence_cultist7 = NumericBadConsequence.new("Pintalabios negro. Pierdes 2 niveles.", 2, 0, 0)
      prize_cultist7 = Prize.new(1,1)
      @unusedMonsters<<Monster.newCultist("Lolitagooth", 2, prize_cultist7, badConsequence_cultist7, 3)

    end

    def initCultistCardDeck
      @unusedCultists<<Cultist.new("Boletus", 2)
      @unusedCultists<<Cultist.new("Agaricus", 1)
      @unusedCultists<<Cultist.new("Daldinia", 1)
      @unusedCultists<<Cultist.new("Bolbitius", 2)
      @unusedCultists<<Cultist.new("Calvatia", 1)
      @unusedCultists<<Cultist.new("Dermoloma", 1)
    end

    def shuffleTreasures
      @unusedTreasures.shuffle!
    end

    def shuffleMonsters
      @unusedMonsters.shuffle!
    end

    def shuffleCultist
      @unusedCultists.shuffle!
    end

    public
    def getInstance
      inst = CardDealer.instance
    end

    def nextTreasure
      if @unusedTreasures.empty?
        @unusedTreasures = Array.new(@usedTreasures)
        @usedTreasures.clear
        shuffleTreasures
      end

      tesoro = @unusedTreasures[0]
      @unusedTreasures.delete_at(0)

      return tesoro
    end

    def nextMonster
      if @unusedMonsters.empty?
        @unusedMonsters = Array.new(@usedMonsters)
        @usedMonsters.clear
        shuffleMonsters
      end

      monst = @unusedMonsters[0]
      @unusedMonsters.delete_at(0)

      return monst
    end

    def nextCultist
      @unusedCultists.delete_at(0)
    end

    def giveTreasureBack(t)
      @usedTreasures<<t
    end

    def giveMonsterBack(m)
      @usedMonsters<<m
    end

    def initCards
      initMonsterCardDeck
      shuffleMonsters
      initTreasureCardDeck
      shuffleTreasures
      initCultistCardDeck
      shuffleCultist
    end
  end
end
