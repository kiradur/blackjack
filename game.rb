class Game
  attr_reader :bank_player, :bank_computer, :player, :computer, :all_bank, :desk
  attr_writer :all_bank

  def initialize(player, computer)
    @player = player
    @computer = computer
    @bank_player = 0
    @bank_computer = 0
    @desk = Desk.new
  end

  def bank 
    @bank_player = 100
    @bank_computer = 100
  end

  def bet
    @bank_player  -= 10
    @bank_computer -= 10
    @all_bank += 20
  end

  def deal_card
    2.times { @desk.add_card(@player) }
    2.times { @desk.add_card(@computer) }
  end

  def player_go
    @desk.add_card(@player)
  end

  def computer_go
    @desk.add_card(@computer) if @computer.value < 17
  end

  def draw?
    if @computer.value == @player.value
      draw_bank
    elsif @computer.value > 21 && @player.value > 21
      draw_bank
    end
  end

  def player_win?
    if @player.value <= 21 && @computer.value < @player.value
      player_bank_win
    elsif @computer.value > 21 && !draw?
      player_bank_win
    end
  end

  def computer_win?
    if @computer.value <= 21 && @computer.value > @player.value
      computer_bank_win
    elsif @player.value > 21 && !draw?
      computer_bank_win
    end
  end

  def draw_bank
    @bank_player += @all_bank / 2
    @bank_computer += @all_bank / 2
  end

  def player_bank_win
    @bank_player += @all_bank
  end

  def computer_bank_win
    @bank_computer += @all_bank
  end
end
