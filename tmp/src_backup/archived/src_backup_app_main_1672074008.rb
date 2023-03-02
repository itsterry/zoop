require 'app/background.rb'
require 'app/game.rb'
require 'app/line.rb'
require 'app/player.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick(args)
  $game ||= Game.new args
  $game.setup if args.state.tick_count == 1
  $game.tick args
end
