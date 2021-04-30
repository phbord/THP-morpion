class BoardCase
    attr_accessor :content, :position

    def initialize(posX,posY)
        @position = [posX,posY]
        @content = nil
    end

    def change_content(symbol)

        if(self.content)
            puts "in BoardCase change_content is call but symbol is there"
            return
        end
        self.content = symbol
    end
end
