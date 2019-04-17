class Interface
  attr_accessor :cards

  def initialize(game)
    @game = game
    start
    run
  end

  def start
    puts 'Как тебя зовут: '
    @name_player = gets.chomp.capitalize!
    puts "Привет #{@name_player}, давай начнем игру!"
  end

  def run
    @game.bank if @game.bank_player <= 0 || @game.bank_computer <= 0
    @desk = Desk.new
    @game.all_bank = 0
    info
    menu
    @game.bet
    @game.deal_card
    continue
  end

  def menu
    puts '1. Пропустить'
    puts '2. Добавить карту'
    puts '3. Открыть карты'
    puts '0. Выйти'

    choice = gets.chomp
    case choice
    when '1'
      @game.player.cards.count == 3 ? who_win? : @game.computer_go
    when '2'
      @game.computer.cards.count == 3 ? who_win? : @game.player_go
    when '3'
      who_win?
    when '4'
      exit
    end
  end

  def who_win?
    info
    bill
    if @game.draw?
      draw
    elsif @game.player_win?
      player_win
    elsif @game.computer_win?
      computer_win
    end
    continue
  end

  def info
    system 'clear'
    puts "У Диллера: #{@game.bank_computer} $"
    @game.player.cards.count == 2 ? @game.computer.show_hidden : @game.computer.show
    puts "У #{@name_player}: #{@game.bank_player} $ "
    @game.player.show
  end

  def bill
    puts "Cчет: #{@game.player.total_value}"
    puts "Cчет Диллера: #{@game.computer.total_value}"
  end

  def player_win
    puts "#{@name_player} победил"
  end

  def computer_win
    puts 'Диллер победил'
  end

  def draw
    puts 'Ничья!'
  end

  def continue
    puts "Для продолжения игры нажмите 'Y'"
    run if gets.chomp == 'Y'
  end
end
