require 'singleton'
module NapakalakiGame

  class Dice
    include Singleton

    private
    def initialize
    end

    public
    def getInstance
      inst = Dice.instance
    end

    def nextNumber
      [*1..6].sample
      #1+rand(6)
    end
  end
end

 #puts Dice.instance.nextNumber
