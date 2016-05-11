module NapakalakiGame
  class DeathBadConsequence < NumericBadConsequence
    def initialize(text)
      super(text, Player.MAXLEVEL, BadConsequence.MAXTREASURES, BadConsequence.MAXTREASURES)
    end

    def to_s
      "#{text}\n"
    end
  end
end
