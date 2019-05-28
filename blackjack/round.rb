module Blackjack
  class Round
    def initialize(hands:)
      @hands = hands
      @deck = Deck.new

      hands.each do |hand|
        2.times { give_card(hand) }
      end
    end

    def start
      @hands.each { |hand| play_hand(hand) }

      puts "\nRound is done. Time for results \n"
      WinnerDetector.new(hands: @hands).inspect
    end

    def give_card(hand, notify: false)
      new_card = @deck.pop
      puts "New cards: #{new_card.inspect}\n" if notify

      hand.add_card(new_card)
    end

    def pass(hand)
      puts "Pass."
    end

    private

    def play_hand(hand)
      puts "\n#{hand.name} turn."

      turn = Turn.new(round: self, hand: hand)

      until (turn.done? || Rules.hand_done?(hand)) do
        puts hand.inspect
        turn.make
      end

      show_final_message(hand)
    end

    def show_final_message(hand)
      if Rules.lose?(hand)
        puts "Too much, #{hand.score}, you lost." 
      elsif Rules.win?(hand)
        puts "Congrats! You have 21"
      else
        puts "Turn is done. Your score is #{hand.score}"
      end
    end
  end
end
