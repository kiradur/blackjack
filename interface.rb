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
    @game.player.clean
    @game.computer.clean
    @game.desk.shuffle
    @game.all_bank = 0
    @game.bet
    @game.deal_card
    menu
  end

  def menu
    system 'clear'
    info
    show_card_game
    puts '1. Пропустить'
    puts '2. Добавить карту'
    puts '3. Открыть карты'
    puts '0. Выйти'

    choice = gets.chomp
    case choice
    when '1'
      @game.computer_go
      @game.player.cards.count == 3 ? who_win? : menu
    when '2'
      @game.player_go
      @game.computer.cards.count == 3 ? who_win? : menu
    when '3'
      who_win?
    when '4'
      exit
    end
  end

  def who_win?
    info
    show_card
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
    puts "У #{@name_player}: #{@game.bank_player} $ "
  end

  def show_card_game
     @game.computer.show_hidden
    @game.player.show
  end

  def show_card
    @game.computer.show
    @game.player.show
  end

  def bill
    puts "Cчет: #{@game.player.value}"
    puts "Cчет Диллера: #{@game.computer.value}"
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
