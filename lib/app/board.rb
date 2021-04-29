
class Board
    attr_accessor :full_board

    def initialize
        @full_board = (1..3).map{|x| (1..3).map{|y|(BoardCase.new(x,y))}}
    end

    def get_case(position)
        full_board[position[0] - 1][position[1] - 1]
    end

    def insert(player, position)
        if (get_case(position).content != nil)
            puts
            puts "This case is already taken"
            return false
        else
            get_case(position).change_content(player.symbol)
        end
    end
end

