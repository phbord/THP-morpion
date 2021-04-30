require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)
require 'app/game'
require 'app/player'
require 'app/board'
require 'app/board_case'
require 'app/show'
require 'app/application'
#binding.pry

application = Application.new
application.start
# game.player_turn(game.player1)


#3. faire que le jeu se lance et logique victoire app
#4. refactor
#5. un programme qui joue le gens

