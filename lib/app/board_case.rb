class BoardCase
    attr_accessor :content, :position

    def initialize(posX,posY)
        @position = [posX,posY]
        @content = nil
    end

    def change_content(symbol)
        self.content = symbol
    end
    def hello
        puts "hello i'm at #{position}, my content is #{position} "
    end
end

#game.,e.player1, [1,1])
#()