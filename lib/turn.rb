require './lib/player'

class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      :basic
    elsif @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      :mutually_assured_destruction
    else
      :war
    end
  end

  def winner
    if type == :basic
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        return @player1
      else
        return @player2
      end
    elsif type == :war
      if @player1.deck.card[2].rank > @player2.deck.cards[2].rank
        return @player1
      else
        return @player2
      end
    elsif type == :mutually_assured_destruction
      return "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
      end
    elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |spoil|
      if winner == player1
        player1.deck.cards.push(spoil)
      elsif winner == player2
        player2.deck.cards.push(spoil)
      end
    end
  end



end