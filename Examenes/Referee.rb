

#EXAMEN
require_relative 'Dice'



module NapakalakiGame
  class Referee
    @@instance = nil

    private_class_method :new
    def initialize(name)
      @name = name
    end

    public
    def self.getInstance
      if @@instance.nil?
        @@instance = new("NombreCualquiera")
      else
        @@instance
      end
    end

    def getName()
      @name
    end

    def judge(i)
       dado = Dice.instance
       numero = dado.nextNumber;


       if i < numero
         true
       else
         false
       end
    end
  end
end


#FIN DEL EXAMEN
