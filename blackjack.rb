class BlackJack
  def initialize
    player = Hand.new
    computer = Hand.new
    game = Game.new(player, computer)
    Interface.new(game)
  end
end

