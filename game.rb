class Game
  attr_reader :bank_player, :bank_computer, :player, :computer, :all_bank

  def initialize
    @bank_player = 100
    @bank_computer = 100
    @desk = Desk.new
    @player = Hand.new
    @computer = Hand.new
    @interface = Interface.new
    @all_bank = 0
  end

  def run
    @interface.info
    @interface.menu
    bet
    deal_card
    continue
  end

  def bet
    @bank_player -= 10
    @bank_computer -= 10
    @all_bank += 20
  end

  def deal_card
    2.times { @desk.add_card(@player) }
    2.times { @desk.add_card(@computer) }
  end

  def player_go
    @desk.add_card(@player)
    @player.cards.count == 3 ? who_win? : computer_go
  end

  def computer_go
    @desk.add_card(@computer) if @computer.total_value < 17
    @computer.cards.count == 3 ? who_win? : player_go
  end

  def who_win?
    @interface.info
    @interface.bill
    draw?
    player_win?
    computer_win?
  end

  def draw?
    if @computer.total_value == @player.total_value
      draw_bank
    elsif @computer.total_value > 21 && @player.total_value > 21
      draw_bank
    end
  end

  def player_win?
    if @player.total_value <= 21 && @computer.total_value < @player.total_value
      player_bank_win
    elsif @computer.total_value > 21 && !draw?
      player_bank_win
    end
  end

  def computer_win?
    if @computer.total_value <= 21 && @computer.total_value > @player.total_value
      computer_bank_win
    elsif @player.total_value > 21 && !draw?
      computer_bank_win
    end
  end

  def draw_bank
    @player_bank += @game_bank / 2
    @dealer_bank += @game_bank / 2
    @interface.draw
  end

  def player_bank_win
    @player_bank += @game_bank
    @interface.player_win
  end

  def computer_bank_win
    @computer_bank += @game_bank
    @interface.computer_win
  end
end
