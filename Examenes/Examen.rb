#EXAMEN


require_relative "Napakalaki"
module NapakalakiGame
class Examen
  def run
    tesoros = []
    jugador1 = Player.new("Jugador 1")
    jugador2 = Player.new("Jugador 2")

    tesoros<<Treasure.new("Necro-comicon", 1,TreasureKind::ONEHAND)
    tesoros<<Treasure.new("Necrotelecom", 2,TreasureKind::HELMET)
    tesoros<<Treasure.new("Gaita", 4,TreasureKind::BOTHHANDS)
    tesoros<<Treasure.new("Zapato deja-amigos", 1,TreasureKind::SHOES)
    tesoros<<Treasure.new("Necro-comicon", 1,TreasureKind::ONEHAND)
    tesoros<<Treasure.new("¡Si mi amo!", 4,TreasureKind::HELMET)


    jugador1.setHiddenTreasures(tesoros)
    aux = 0
    auxiliar = Array.new(tesoros)
    for t in auxiliar
      jugador1.makeTreasureVisible(t)
      puts "Tesoros visibles:"
      for i in jugador1.getVisibleTreasures
        puts i.to_s
      end

      puts "Tesoros ocultos:"
      for j in jugador1.getHiddenTreasures
        puts j.to_s
      end
    end

    puts jugador1.to_s



    tesoros2 = []
    tesoros3 = []
    tesoros2<<Treasure.new("One_Hand_0", 0,TreasureKind::ONEHAND)
    tesoros2<<Treasure.new("Helmet_0", 0,TreasureKind::HELMET)
    jugador2.setVisibleTreasures(tesoros2)


    tesoros3<<Treasure.new("tso1", 0,TreasureKind::BOTHHANDS)
    tesoros3<<Treasure.new("tso2", 0,TreasureKind::ARMOR)
    tesoros3<<Treasure.new("tso3", 0,TreasureKind::SHOES)

  end
end
end
#FIN DE EXAMEN
