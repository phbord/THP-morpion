class Game
    attr_accessor :player1, :player2, :board, :show

    def initialize(player1, player2)
        @player1 = player1
        @player2  = player2
        @board = Board.new
        @show = Show.new(@board)
    end

    def play
        count = 1
        while(true )
            player_turn(player1)
            count += 1
            if (victory || count > 9)
                break
            end
            player_turn(player2)
            count += 1
            if (victory || count > 9)
                break
            end
        end
        case victory
        when "O"
            puts "The winner is #{player1.name}"
        when "X"
            puts "The winner is #{player2.name}"
        else
            puts "There is no winner, this a draw!"
        end
        replay
    end

    #idk is we need it
    def replay
        $reponse
        loop do
            puts "Do you want play again? [y/n]"
            $reponse = gets.chomp
            break if ($reponse.downcase.start_with?("y") || $reponse.downcase.start_with?("n"))
        end
        if ($reponse.downcase.start_with?("y"))
                @board = Board.new
                @show = Show.new(@board)
                puts "replay"
                self.play
        else
                puts "see you !"
                return
        end
    end

    def line_victory
        symbol_result = nil
        (1..3).each do |x|
            x_symbol_count = 0
            o_symbol_count = 0
            (1..3).each do |y|
                content = @board.get_case([x,y]).content
                x_symbol_count += 1 if (content == "X")
                o_symbol_count += 1 if (content == "O")

                return symbol_result = "X" if (x_symbol_count == 3) #"X" a gagné
                return symbol_result = "O" if (o_symbol_count == 3) #"O" a gagné
            end
        end
        #retourne "X", "O" ou nil
        return symbol_result
    end

    def column_victory
        symbol_result = nil
        (1..3).each do |x|
            x_symbol_count = 0
            o_symbol_count = 0
            (1..3).each do |y|
                content = @board.get_case([y,x]).content
                x_symbol_count += 1 if (content == "X")
                o_symbol_count += 1 if (content == "O")

                return symbol_result = "X" if (x_symbol_count == 3)
                return symbol_result = "O" if (o_symbol_count == 3)
            end
        end
        #retourne "X", "O" ou nil
        return symbol_result
    end

    def diagonal_victory
        condition_diag_1 = [
            @board.get_case([1,1]).content,
            @board.get_case([2,2]).content,
            @board.get_case([3,3]).content
        ]
        condition_diag_2 = [
            @board.get_case([1,3]).content,
            @board.get_case([2,2]).content,
            @board.get_case([3,1]).content
        ]
        symbol_result = nil

        if (condition_diag_1.all?{|symbol| symbol == "X"})
            symbol_result = "X"
            return symbol_result 
        end
        if (condition_diag_1.all?{|symbol| symbol == "O"})
            symbol_result = "O"
            return symbol_result 
        end
        if (condition_diag_2.all?{|symbol| symbol == "O"})
            symbol_result = "O"
            return symbol_result 
        end
        if (condition_diag_2.all?{|symbol| symbol == "X"})
            symbol_result = "X"
            return symbol_result
        end

        return symbol_result
    end

    def victory
        line_victory || column_victory || diagonal_victory
    end

    #message au board, avec les players en args
    def player_turn(player)
        puts "it's time for #{player.name} to play"
        puts "Here is the current game"
        show.status
        move = choice(player)
        p "move"
        p move
        board.insert(player,move)
        puts " here is the new board"
        show.status
    end

    def number?(obj)
        obj = obj.to_s unless obj.is_a? String
        /\A[+-]?\d+(\.[\d]+)?\z/.match(obj)
    end

    def choice(player)
        $input
        loop do
            puts "where do you want to play your #{player.symbol} (accepted [x,y] between 1 and 3) "
            $input = gets.chomp.split(',').map{|x| x.to_i}
            break if (($input[0].to_i.between?(1,3) && $input[1].to_i.between?(1,3) && board.insert(player,  $input) ))
        end
        $input
    end
end