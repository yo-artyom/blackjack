module Blackjack
  class Turn
    attr_reader :turn

    def initialize(round:, hand:)
      @round = round
      @hand = hand
      @done = false
    end

    def make
      puts "Take a new card: N, Pass: P\n"

      ask_for_decision
    end

    def done?
      @done
    end

    private

    def ask_for_decision
      dec = gets until dec =~ /p|n/i
      dec =~ /n/i ? new_card : pass
    end

    def new_card
      @round.give_card(@hand, notify: true)
      @done = false
    end

    def pass
      @round.pass(@hand)
      @done = true
    end
  end
end
