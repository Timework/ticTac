require './lib/tic'

RSpec.describe Game do
    before(:each) do
        @game = Game.new
    end
    describe "gameover" do
        it "Game is over when there is a vertical line" do
            @game.createBoard
            @game.change("1","x","Chris")
            @game.change("4","x","Chris")
            @game.change("7","x","Chris")
            @game.gameovers("Chris")
            expect(@game.gameover).to eql(TRUE)
        end

        it "Game is over when there is a horizontal line" do
            @game.createBoard
            @game.change("1","x","Chris")
            @game.change("2","x","Chris")
            @game.change("3","x","Chris")
            @game.gameovers("Chris")
            expect(@game.gameover).to eql(TRUE)
        end

        it "Game is over when there is a diagonal line" do
            @game.createBoard
            @game.change("1","x","Chris")
            @game.change("5","x","Chris")
            @game.change("9","x","Chris")
            @game.gameovers("Chris")
            expect(@game.gameover).to eql(TRUE)
        end

        it "Game is not over" do
            @game.createBoard
            @game.change("1","x","Chris")
            @game.change("2","x","Chris")
            @game.change("4","x","Chris")
            @game.gameovers("Chris")
            expect(@game.gameover).to eql(FALSE)
        end

        it "Game is not over again" do
            @game.createBoard
            @game.change("1","x","Chris")
            @game.change("5","x","Chris")
            @game.change("6","x","Chris")
            @game.gameovers("Chris")
            expect(@game.gameover).to eql(FALSE)
        end
    end

    describe "#tie" do
        it "Game tie's properly" do
            @game.createBoard
            @game.change("1","x","Chris")
            @game.change("2","0","Chris")
            @game.change("3","x","Chris")
            @game.change("4","0","Chris")
            @game.change("5","x","Chris")
            @game.change("6","0","Chris")
            @game.change("7","0","Chris")
            @game.change("8","x","Chris")
            @game.change("9","0","Chris")
            @game.ties
            expect(@game.tie).to eql(TRUE)
        end

        it "Game doesn't tie" do
            @game.createBoard
            @game.change("1","x","Chris")
            @game.change("2","0","Chris")
            @game.change("3","x","Chris")
            @game.change("4","0","Chris")
            @game.change("5","x","Chris")
            @game.change("6","0","Chris")
            @game.change("7","0","Chris")
            @game.change("8","x","Chris")
            @game.ties
            expect(@game.tie).to eql(FALSE)
        end
    end
end