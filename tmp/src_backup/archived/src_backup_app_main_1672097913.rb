require 'app/background.rb'
require 'app/game.rb'
require 'app/line.rb'
require 'app/player.rb'
require 'app/target.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick(args)
  raise $game
  return $game.tick(args) if $game

  $game ||= Game.new args
  $game.setup
end
