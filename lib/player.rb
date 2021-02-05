require './lib/deck'

class Player
  attr_reader :name,
              :deck
  
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    @has_lost = false
    if @deck.cards.length == 0
      @has_lost = true
    end
    @has_lost
  end

end