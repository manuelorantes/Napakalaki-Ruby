require './Prize.rb'
require './TreasureKind.rb'
require_relative 'Monster'
require './BadConsequence.rb'
require_relative 'EstadisticaTesorosGanados'



#Comprueba y mete en un array os monstruos que tienen mas de diez niveles estrictamente.
#Primera forma de hacer bucles en ruby a la vez que se introducen en un vector. No cambia el vector inicial
def Comprueba_NivelSuperior_10(monstruos)
  monstruos.select {|m| m.combatLevel > 10}
end

#Comprueba que el mal rollo solo te hace perder niveles
#Este bucle esta hecho de forma parecida a Java. El return es innecesario ya que el for es lo ultimo ejecutado
def Comprueba_MalRollo_Solo_PerderNivel(monstruos)
  devolver = Array.new
  for m in monstruos
    devolver<<m if m.bc.visible == 0 && m.bc.hidden == 0 && m.bc.specificVisible.empty? && m.bc.specificHidden.empty?
  end
  return devolver
end

#Devuelve los monstruos que te permiten ganar mas e un nivel
def Comprueba_GanarMasde_1Nivel(monstruos)
  devolver = Array.new
  for m in monstruos
    devolver<<m if m.prize.level > 1
  end
  return devolver
end

#Devuelve los monstruos que te hacen perder objetos especificos, ya sean visibles u ocultos
def Comprueba_PierdeTesoros_Determinados(monstruos)
  monstruos.select  {|m| !m.bc.specificVisible.empty? || !m.bc.specificHidden.empty?}
end

monsters = Array.new


#Meto los monstrous

#El rey de rosa
badConsequence1 = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles.", 5, 3, 0)
prize1 = Prize.new(4,2)
monsters<<Monster.new("El rey de rosa", 13, prize1, badConsequence1)

#Byakhees de bonanza
badConsequence2 = BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta.", 0,
  [TreasureKind::ARMOR], [TreasureKind::ARMOR] )
prize2 = Prize.new(2,1)
monsters<<Monster.new("Byakhees de bonanza", 8, prize2, badConsequence2)

#Chibithulhu
badConsequence3 = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio te descartas de tu casco visible.", 0,
[TreasureKind::HELMET], [])
prize3 = Prize.new(1,1)
monsters<<Monster.new("Chibithulhu", 2, prize3, badConsequence3)

#El sopor de Dunwich
badConsequence4 = BadConsequence.newLevelSpecificTreasures("El primordial bostezo contagioso. Pierdes el calzado visible.", 0,
[TreasureKind::SHOES], [])
prize4 = Prize.new(1,1)
monsters<<Monster.new("El sopor de Dunwich", 2, prize4, badConsequence4)

#Ángeles de la noche ibicenca
badConsequence5 = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo." +
" Descarta 1 mano visible y 1 mano oculta.", 0,
[TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
prize5 = Prize.new(4,1)
monsters<<Monster.new("Ángeles de la noche ibicenca", 14, prize5, badConsequence5)

#El gorrón en el umbral
badConsequence6 = BadConsequence.newLevelNumberOfTreasures("Pierdes todos tus tesoros visibles.", 0, 10, 0)
prize6 = Prize.new(3,1)
monsters<<Monster.new("El gorrón en el umbral", 10, prize6, badConsequence6)

#H.P. Munchcraft
badConsequence7 = BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible.", 0,[TreasureKind::ARMOR], [])
prize7 = Prize.new(2,1)
monsters<<Monster.new("H.P. Munchcraft", 6, prize7, badConsequence7)

#Bichgooth
badConsequence8 = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible.", 0,
[TreasureKind::ARMOR], [])
prize8 = Prize.new(1,1)
monsters<<Monster.new("Bichgooth", 2, prize8, badConsequence8)

#La que redacta en las tinieblas
badConsequence9 = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles.", 2, 0, 0)
prize9 = Prize.new(1,1)
monsters<<Monster.new("La que redacta en las tinieblas", 2, prize9, badConsequence9)

#Los hondos
badConsequence10 = BadConsequence.newDeath("Estos monsters resultan bastante superficiales y te aburren mortalmente. Estas muerto.")
prize10 = Prize.new(2,1)
monsters<<Monster.new("Los hondos", 8, prize10, badConsequence10)

#Semillas Cthulhu
badConsequence11 = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 tesoros ocultos.", 2, 0, 2)
prize11 = Prize.new(2,1)
monsters<<Monster.new("Semillas Cthulhu", 4, prize11, badConsequence11)

#Dameargo
badConsequence12 = BadConsequence.newLevelSpecificTreasures("Te intentas escaquear. Pierdes una mano visible.", 0,
[TreasureKind::ONEHAND], [])
prize12 = Prize.new(2,1)
monsters<<Monster.new("Dameargo", 1, prize12, badConsequence12)

#Pollipólipo volante
badConsequence13 = BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
prize13 = Prize.new(1,1)
monsters<<Monster.new("Pollipólipo volante", 3, prize13, badConsequence13)

#Yskhtihyssg-Goth
badConsequence14 = BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estas muerto.")
prize14 = Prize.new(3,1)
monsters<<Monster.new("Yskhtihyssg-Goth", 12, prize14, badConsequence14)

#Familia feliz
badConsequence15 = BadConsequence.newDeath("La familia te atrapa. Estás muerto.")
prize15 = Prize.new(4,1)
monsters<<Monster.new("Familia feliz", 1, prize15, badConsequence15)

#Roboggoth
badConsequence16 = BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro " +
"2 manos visible.", 2,[TreasureKind::BOTHHANDS], [])
prize16 = Prize.new(2,1)
monsters<<Monster.new("Roboggoth", 8, prize16, badConsequence16)

#El espia
badConsequence17 = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible.", 0,
[TreasureKind::HELMET], [])
prize17 = Prize.new(1,1)
monsters<<Monster.new("El espia", 5, prize17, badConsequence17)

#El Lenguas
badConsequence18 = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
prize18 = Prize.new(1,1)
monsters<<Monster.new("El Lenguas", 20, prize18, badConsequence18)

#Bicéfalo
badConsequence19 = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros " +
"visibles de las manos.", 3,
[TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS], [])
prize19 = Prize.new(1,1)
monsters<<Monster.new("Bicéfalo", 20, prize19, badConsequence19)

=begin
puts "\nMonstruos con nivel superior a 10"
devolver = Comprueba_NivelSuperior_10(monsters)

for i in devolver
  puts i.to_s
end

=begin
puts "\nMal rollo que solo pierden nivel"
devolver = Comprueba_MalRollo_Solo_PerderNivel(monsters)

for i in devolver
  puts i.to_s
end
=end

=begin
puts "\nMonstruos que te dan mas de un nivel si los vences"
devolver = Comprueba_GanarMasde_1Nivel(monsters)

for i in devolver
  puts i.to_s
end
=end

#Tambien se puede hacer con print en vez de puts, la diferencia es que puts hace ya un "\n" y print no
#Es innecesario el to_s en todos estos bucles. Ruby busca directamente el metodo to_s, si debemos crearlo

=begin
puts "\nMonstruos que te hacen perder objetos determinados"
devolver = Comprueba_PierdeTesoros_Determinados(monsters)

for i in devolver
  puts i
end
=end


#Pruba de funcionamiento del todos los monstruos para ver sus estadisticas de tesoros
DatosEstadisticos = EstadisticaTesorosGanados.new(monsters)
puts DatosEstadisticos.to_s
