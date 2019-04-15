class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def value
    total = 0
    ace = 0
    @cards.each do |card|
      ace += 1 if card.value == 11
      total += card.value
    end
    ace >= 1 && total > 21 ? total - 10 : total
  end

  def show
    @cards.each { |card| puts card.display.to_s }
  end

  def show_hidden
    @cards.count.times { puts '🂠' }
  end
end
