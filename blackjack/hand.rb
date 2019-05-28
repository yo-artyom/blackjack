module Blackjack
  class Hand
    attr_reader :name

    def initialize(name:)
      @name = name
      @cards = []
    end

    def add_card(card)
      @cards << card
    end

    def inspect
      "Hand: #{@cards.map(&:inspect)}. Your score: #{score}"
    end

    def score
      ScoreCalculator.new(@cards).calculate
    end
  end
end
