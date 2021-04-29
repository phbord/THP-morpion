class Application
    attr_accessor :game, :player1, :player2, :show

    def initialize(name1, name2)
        @player1 = Player.new name1
        @player2 = Player.new name2
        @game = Game.new(@player1, @player2)
        @show = Show.new(@game)
    end

    def victory(game)
        x_min, y_min = 1
        x_max, y_max = 3

        #Lines
        winner = nul
        cases = game.board.all_board_case
        (1..3).each do |x_cell|
            condition = [
                cases.get_case(x_cell, 1).content,
                cases.get_case(x_cell, 2).content,
                cases.get_case(x_cell, 3).content
            ]
            if condition.all? { |symbol| symbol == "X" }
                winner = 'X'
            elsif condition.all? { |symbol| symbol == "O" }
                winner = 'O'
            else
                return
            end
        end

        #Columns
        (1..3).each do |y_cell|
            condition = [
                cases.get_case(1, y_cell).content,
                cases.get_case(2, y_cell).content,
                cases.get_case(3, y_cell).content
            ]
            if condition.all? { |symbol| symbol == "X" }
                winner = 'X'
            elsif condition.all? { |symbol| symbol == "O" }
                winner = 'O'
            else
                return
            end
        end

        #Diagonale
        #Diagonale 1
        condition_diag_1 = [
            cases.get_case(1, 1).content,
            cases.get_case(2, 2).content,
            cases.get_case(3, 3).content]
        if(condition_diag_1.all? { |symbol| symbol == "X"})
            winner = 'X'
        elsif(condition_diag_1.all?{|symbol| symbol == "Y"})
            winner = 'O'
        else
            return
        end

        #Diagonale 2
        condition_diag_2 = [cases.get_case(1,3).content,
            cases.get_case(2,2).content,
            cases.get_case(3,1).content]
        if( condition_diag_2.all?{|symbol| symbol == "X"})
            winner = 'X'
        elsif( condition_diag_2.all?{|symbol| symbol == "Y"})
            winner = 'O'
        else
            return
        end
        return winner
    end

end