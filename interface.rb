class Interface
  attr_accessor :cards

  def initialize
    puts 'Как тебя зовут: '
    @name_player = gets.chomp.capitalize!
    puts "Привет #{@name_player}, давай начнем игру!"
    game = Game.new
    game.start
    menu
  end

  def menu
    puts '1. Пропустить'
    puts '2. Добавить карту'
    puts '3. Открыть карты'
    puts '0. Выйти'

    choice = gets.chomp
    case choice
    when '1'
      game.computer_go
    when '2'
      game.player_go
    when '3'
      game.who_win?
    when '4'
      exit
    end
  end
end
