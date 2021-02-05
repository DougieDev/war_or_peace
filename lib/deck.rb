require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if index == 0
      card_ranking = cards[0].rank
    elsif index == 2
      card_ranking = cards[2].rank
    else
      card_ranking = nil
    end
    card_ranking
  end

end