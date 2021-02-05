require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_card_attributes
    assert_equal :diamond, @deck.cards[0].suit
    assert_equal 3, @deck.cards[1].rank
    assert_equal 'Ace', @deck.cards[2].value
  end

  def test_rank_of_card_at_method
    assert_equal 12, @deck.rank_of_card_at(0)
    assert_equal 14, @deck.rank_of_card_at(2)
    assert_nil nil, @deck.rank_of_card_at(1)
  end

  def test_high_ranking_cards_method
    assert_equal [@card1, @card3], @deck.high_ranking_cards
  end

  def test_percent_high_ranking_method
    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_remove_card_method
    @deck.remove_card

    assert_equal 2, @cards.length
    assert_equal :spade, @deck.cards[0].suit
  end

end