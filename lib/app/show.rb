class Show
    attr_accessor :board

    def initialize(board)
        @board = board
    end

    def status
        puts "-" * 13
        (1..3).each do |x|
            print('|')
            (1..3).each do |y|
                unless board.get_case([x,y]).content
                    print('   ')
                else
                    print " #{board.get_case([x,y]).content} "
                end
                print('|') 
            end
            puts
        end
        puts "-" * 13
    end
end