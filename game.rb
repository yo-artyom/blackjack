require_relative 'blackjack'

module Game
  class << self
    def start
      hands = %w[Artem Leha Gera].map do |name|
        Blackjack::Hand.new(name: name)
      end

      round = Blackjack::Round.new(hands: hands).start
    end

    def full_game
      puts "Enter players number"
      player_count = 0

      unless player_count =~ /\d/ && player_count > 1
        player_count = gets
      end

      hands = []
      player_count.to_i.times do |number|
        puts "Enter player #{number} name:"
        name = gets
        hands << Blackjack::Hand.new(name: name.strip)
      end

      round = Blackjack::Round.new(hands: hands).start
    end
  end
end
