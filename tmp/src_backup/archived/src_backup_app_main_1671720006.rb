require 'app/background.rb'
require 'app/player.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick(args)
  args.state.player = Player.new args
  player(args).place
end

def player(args)
  args.state.player
end

