class Application
    attr_accessor :game, :player1, :player2, :show

    def initialize()
        2.times do |n|
            puts "The player n°#{n} must be enter his name :\n"
            print "> "
            name = gets.chomp.to_s
            n == 0 ? @player1 = Player.new(name) : @player2 = Player.new(name)
        end
        @game = Game.new(@player1, @player2)
        @show = Show.new(@game)
    end

    def start
        game.play
    end
end