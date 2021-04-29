class Show
    attr_accessor :board

    def initialize(board)
        @board = board
    end

    def show_board
        # puts "-" * 13
        # content_y = ""
        # (1..3).each do |v|
        #     content_y += "|"
        #     content_y += " #{board.board.get_case([i,j])} "
        # end
        # content_y += "|"
        # puts content_y

        puts "-" * 13
        (1..3).each do |i|
            print('|')
            (1..3).each do |j|
                unless board.board.get_case([i,j]).content
                    print('   ')
                else
                    print " #{board.board.get_case([i,j]).content} "
                end
                print('|')
                
            end
            puts
        end
        puts "-" * 13
    end
end