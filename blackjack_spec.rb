require_relative 'blackjack'
require 'rspec'

RSpec.describe Blackjack do
  describe 'Aces Logic' do
    let(:hand) { Blackjack::Hand.new(name: 'test') }

    it 'calculates the right value' do
      %w[2 8 A].each { |value| hand.add_card(Deck::Card.new(value: value, suit: '+')) }
      expect(hand.score).to eq 21
    end

    it 'calculates the right value' do
      %w[4 8 8 A].each { |value| hand.add_card(Deck::Card.new(value: value, suit: '+')) }
      expect(hand.score).to eq 21
    end

    it 'calculates the right value' do
      %w[8 2 10 A].each { |value| hand.add_card(Deck::Card.new(value: value, suit: '+')) }
      expect(hand.score).to eq 21
    end

    it 'calculates the right value' do
      %w[2 A].each { |value| hand.add_card(Deck::Card.new(value: value, suit: '+')) }
      expect(hand.score).to eq 13
    end

    it 'calculates the right value' do
      %w[A].each { |value| hand.add_card(Deck::Card.new(value: value, suit: '+')) }
      expect(hand.score).to eq 11
    end
  end
end
