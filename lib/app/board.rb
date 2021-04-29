class Board
    attr_accessor :all_board_case

    def initialize
        # board_case = BoardCase.new
        # @all_board_case = []
        @all_board_case = create_all_board_case
    end
    # [0,1,2,3,4,5,6,7,8]
    # [[0,1,2],...]
    # get_case([1,2])

    #a modifier later
    def create_all_board_case
        result = []
        (1..3).map do |x|
            tmp = []
            (1..3).map do |y|
                tmp.push(BoardCase.new(x,y))
            end
            result.push(tmp)
        end
        return result
    end

    def get_case(position)
        all_board_case[position[0] - 1][position[1] - 1]
    end

    def insert(player, position)
        get_case(position).change_content(player.symbol)
    end

end

