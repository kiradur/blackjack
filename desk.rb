class Desk
  attr_accessor :cards

  IMPORT = %w[♣ ♥ ♠ ♦].freeze
  FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze

  def initialize
    @cards = []
    IMPORT.each do |import|
      FACES.each do |face|
        @cards << Card.new(import, face)
      end
    end
  end

  def add_card(hand)
    hand.cards << @cards.slice!(1)
  end

  def shuffle
    @cards.shuffle!
  end
end
