require 'pry'
class Deck
  SUITS = %w[♠	♥	♦	♣]
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A]

  def initialize
    @cards = build_cards.shuffle
  end

  def pop
    @cards.pop
  end

  private

  def build_cards
    VALUES.each_with_object([]) do |value, cards|
      SUITS.each do |suit|
        cards.push(Card.new(value: value, suit: suit))
      end
    end
  end

  class Card
    attr_reader :value, :suit

    def initialize(value:, suit:)
      @suit = suit
      @value = value
    end

    def inspect
      "#{value}#{suit}"
    end
  end
end

