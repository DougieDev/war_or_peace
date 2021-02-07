require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game

  attr_reader :player1,
              :player2,
              :turn_count
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 1
  end

  def welcome
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora"
    p "Type 'GO' to start the game!"
    p "-------------------------------------------------------------------"
  end

  def start
    turn = Turn.new(@player1, @player2)
    while @turn_count <= 1000000
      @turn_count += 1
      if turn.type == :basic
        winner = turn.winner
        p "Turn #{@turn_count}: #{turn.winner.name} won 2 cards"
        turn.pile_cards
        turn.award_spoils(winner)
      elsif turn.type == :war
        winner = turn.winner
        p "Turn #{@turn_count}: WAR - #{turn.winner.name} won 6 cards"
        turn.pile_cards
        turn.award_spoils(winner)
      else turn.type == :mutually_assured_destruction
        winner = turn.winner
        p "Turn #{@turn_count}: Mutually Assured Destruction - 6 cards removed from play"
        turn.pile_cards
      end

      if player1.has_lost?
        p "*~*~*~* #{player2.name} has won the game *~*~*~*"
        break
      elsif player2.has_lost?
        p "*~*~*~* #{player1.name} has won the game *~*~*~*"
        break
      end

      if @turn_count == 1000000
        p "---Draw---"
      end
    end
  end
end