require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)


    @cards1 = [@card1, @card2, @card5, @card8]
    @cards2 = [@card3, @card4, @card6, @card7]

    @deck1 = Deck.new(@cards1)
    @deck2 = Deck.new(@cards2)

    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exist
    assert_instance_of Turn, @turn
  end

  def test_turn_has_players
    assert_equal 'Megan', @turn.player1.name
    assert_equal 'Aurora', @turn.player2.name
  end

  def test_spoils_of_war_is_empty_by_default
    assert_equal [], @turn.spoils_of_war
  end

  def test_type
    assert_equal :basic, @turn.type
  end

  def test_turn_can_have_a_winner
    assert_equal @player1, @turn.winner
  end

  def test_turn_can_pile_cards
    @turn.pile_cards

    assert_equal [@card1, @card3], @turn.spoils_of_war
  end

  def test_award_war_spoils
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)

    assert_equal @deck1, @player1.deck
  end

end