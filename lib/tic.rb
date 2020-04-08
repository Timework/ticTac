class Player
    attr_reader :name
    attr_reader :symbol
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

end
class Game
    attr_reader :gameover
    attr_reader :tie
    def initialize
        @gameover = false
        @tie = false
    end
    def play
        puts "What is the first player's name?"
        name1 = gets.chomp
        @player1 = Player.new(name1, "x")
        puts "What is the second player's name?"
        name2 = gets.chomp
        @player2 = Player.new(name2, "o")
        @gameover = false
        @tie = false
        createBoard
        while !@gameover && !@tie
            if !@gameover && !@tie
                showBoard
                playRound(@player1.name, @player1.symbol)
                gameover(@player1.name)
                tie
            end
            if !@gameover && !@tie
                showBoard
                playRound(@player2.name, @player2.symbol)
                gameover(@player2.name)
                tie
            end
        end
        puts "Would you like to play again? (y/n)"
        retrys
    end

    def createBoard
        @board1 = [1,2,3]
        @board2 = [4,5,6]
        @board3 = [7,8,9]
    end

    def showBoard
        puts
        print @board1.join(" | ")
        puts
        print "---------"
        puts
        print @board2.join(" | ")
        puts
        print "---------"
        puts
        print @board3.join(" | ")
        puts
    end

    def playRound(player, symbol)
        puts "#{player} choose a number"
        move = gets.chomp
        change(move, symbol, player)
    end

    def change(move, symbol, player)
        case move
        when "1"
            if @board1[0] == 1
            @board1[0] = symbol
            else
                puts "That is not a valid number."
                playRound(player, symbol)
            end
        when "2"
            if @board1[1] == 2
            @board1[1] = symbol
            else
                puts "That is not a valid number."
                playRound(player, symbol)
            end
        when "3"
            if @board1[2] == 3
            @board1[2] = symbol
            else
                puts "That is not a valid number."
                playRound(player, symbol)
            end
        when "4"
            if @board2[0] == 4
            @board2[0] = symbol
            else
                puts "That is not a valid number."
                playRound(player, symbol)
            end
        when "5"
            if @board2[1] == 5
            @board2[1] = symbol
            else
                puts "That is not a valid number."
                playRound(player, symbol)
            end
        when "6"
            if @board2[2] == 6
            @board2[2] = symbol
            else
                puts "That is not a valid number."
                playRound(player, symbol)
            end
        when "7"
            if @board3[0] == 7
            @board3[0] = symbol
            else
                puts "That is not a valid number."
                playRound(player, symbol)
            end
        when "8"
            if @board3[1] == 8
            @board3[1] = symbol
            else
                puts "That is not a valid number."
                playRound(player, symbol)
            end
        when "9"
            if @board3[2] == 9
            @board3[2] = symbol
            else
                puts "That is not a valid number."
                playRound(player, symbol)
            end
        else 
            puts "That is not a valid number."
            playRound(player, symbol)
        end     
    end

    def gameovers(player)
        if (@board1[0] == @board1[1] && @board1[1] == @board1[2]) ||
            (@board2[0] == @board2[1] && @board2[1] == @board2[2]) ||
            (@board3[0] == @board3[1] && @board3[1] == @board3[2]) ||
            (@board1[0] == @board2[1] && @board2[1] == @board3[2]) ||
            (@board1[2] == @board2[1] && @board2[1] == @board3[0]) ||
            (@board1[0] == @board2[0] && @board2[0] == @board3[0]) ||
            (@board1[1] == @board2[1] && @board2[1] == @board3[1]) ||
            (@board1[2] == @board2[2] && @board2[2] == @board3[2])
            showBoard
            puts "#{player} won the game!"
            @gameover = true
        end
    end

    def ties
        if @board1[0] != 1 && @board1[1] != 2 && @board1[2] != 3 &&
            @board2[0] != 4 && @board2[1] != 5 && @board2[2] != 6 &&
            @board3[0] != 7 && @board3[1] != 8 && @board3[2] != 9 && !@gameover
            showBoard
            puts "It is a tie!"
            @tie = true
        end
    end

    def retrys
        answer = gets.chomp
        if answer == "y"
            play
        elsif answer != "n"
            puts "Please enter y or n"
            retrys
        end
    end

end