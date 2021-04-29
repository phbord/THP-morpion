# les joueurs
# - 2 instances de cette classe
# - un joueur a un nom et un symbole (x ou o)

class Player
    attr_accessor :player, :id, :symbol
    @@id = 0
    @@symbol = ['O','X']
    def initialize(name)
        @name = name
        @id = nil
        @symbol = nil
        give_id_and_symbol
    end

    def give_id_and_symbol()
        if(@@id > 1)
            return
        end
        self.id = @@id
        self.symbol = @@symbol[self.id]
        @@id += 1
    end

    # def show_status
    #     puts "#{}"
    # end

    def create_player
    end
end