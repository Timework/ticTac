class Player
    attr_reader :name
    attr_reader :symbol
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

end
class Game
    def initialize
        puts "What is the first player's name?"
        name1 = gets.chomp
        player1 = Player.new(name1, "x")
        puts "what is the second player's name?"
        name2 = gets.chomp
        player2 = Player.new(name2, "o")
    end

end
Game.new