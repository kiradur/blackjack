class Interface
  attr_accessor :cards

  def initialize
    @game = Game.new
  end

  def start
    puts 'Как тебя зовут: '
    @name_player = gets.chomp.capitalize!
    puts "Привет #{@name_player}, давай начнем игру!"
  end

  def menu
    puts '1. Пропустить'
    puts '2. Добавить карту'
    puts '3. Открыть карты'
    puts '0. Выйти'

    choice = gets.chomp
    case choice
    when '1'
      @game.computer_go
    when '2'
      @game.player_go
    when '3'
      @game.who_win?
    when '4'
      exit
    end
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
end
