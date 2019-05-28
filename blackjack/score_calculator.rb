module Blackjack
  class ScoreCalculator
    def initialize(cards)
      @cards = cards
    end

    def calculate
      without_aces = @cards.select { |card| card.value != 'A' }
      aces = @cards.select { |card| card.value == 'A' }

      score = without_aces.inject(0) { |acc, card| acc + Rules.score(card) }

      ace_high = score <= Rules::ACE_THRESHOLD

      score += aces.inject(0) { |acc, card| acc + Rules.score(card, ace_high: ace_high) }
    end
  end
end
