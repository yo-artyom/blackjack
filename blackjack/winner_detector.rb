module Blackjack
  class WinnerDetector
    attr_reader :hands

    def initialize(hands:)
      @hands = hands_without_loosers(hands)
    end

    def inspect
      if winners.length > 1
        puts "Winners are #{winners.map(&:name).join(', ')}"
      elsif winners.length == 1
        puts "Winner is #{winners[0].name}!"
      else
        puts "Everyone lost :c"
      end
    end

    private

    def winners
      hands_winners = @hands.select { |hand| Rules.win?(hand) }

      if hands_winners.empty?
        max_score = @hands.map(&:score).max
        hands_winners = hands.select { |hand| hand.score == max_score }
      end

      hands_winners
    end

    def hands_without_loosers(hands)
      hands.select { |hand| !Rules.lose?(hand) }
    end
  end
end
