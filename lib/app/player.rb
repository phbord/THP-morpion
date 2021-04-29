class Player
    attr_accessor :name, :id, :symbol
    @@id = 0
    @@symbol = ['O','X']
    def initialize(name)
        if(@@id >= 2)
            raise "No way to have more than two players"
            return
        else
            @name = name
            @id = @@id
            @symbol = @@symbol[self.id]
            @@id += 1
        end
    end
end