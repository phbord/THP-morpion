require 'bundler'
Bundler.require

#require 'dotenv'
Dotenv.load('.env')

$:.unshift File.expand_path('./../lib', __FILE__)
require 'views/index'
#binding.pry

require 'app/game'
require 'app/player'
require 'app/board'
require 'app/board_case'

