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

  def high_ranking_cards
    high_cards = []
    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
   ((high_ranking_cards.length / @cards.length.to_f) * 100).round(2)
  end
end