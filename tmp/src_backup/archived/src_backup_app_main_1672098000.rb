require 'app/background.rb'
require 'app/game.rb'
require 'app/line.rb'
require 'app/player.rb'
require 'app/target.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick(args)
  $game ||= Game.new args
  if args.state.lines
    $game.tick args
  else
    $game.setup unless args.state.lines
  end
end
