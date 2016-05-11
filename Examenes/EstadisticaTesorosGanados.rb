
require_relative 'Monster'

class EstadisticaTesorosGanados


  def initialize(monstruos)
    @monsters = Array.new
    @min_tesoros = 10
    @med_tesoros = 0
    @max_tesoros = 0
    @total_tesoros = 0


    for m in monstruos

      @min_tesoros = m.prize.treasures if @min_tesoros > m.prize.treasures
      @max_tesoros = m.prize.treasures if @max_tesoros < m.prize.treasures
      @total_tesoros += m.prize.treasures
      @monsters<<m.name
    end
    @med_tesoros = @total_tesoros / monstruos.size
  end

  def to_s
    texto = "\nNombres de los Monstruos:"

    for m in @monsters
      texto += "\n\t"
      texto += m.to_s
    end

    texto += "\n\nTesoros ganados minimo: #{@min_tesoros}
Tesoros ganados medio: #{@med_tesoros}
Tesoros ganados maximo: #{@max_tesoros}\n"

  end

  attr_reader :monsters, :min_tesoros, :med_tesoros, :max_tesoros, :total_tesoros

end
