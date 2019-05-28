module Blackjack
  module Rules
    ACE_THRESHOLD = 10

    class << self
      def score(card, ace_high: true)
        case card.value
        when 'J', 'Q', 'K'
          10
        when 'A'
          ace_high ? 11 : 1
        when /\d\d?/
          card.value.to_i
        end
      end

      def hand_done?(hand)
        hand.score >= 21
      end

      def lose?(hand)
        hand.score > 21
      end

      def win?(hand)
        hand.score == 21
      end
    end
  end
end
