require 'app/background.rb'
require 'app/player.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick(args)
  args.state.background.draw
  args.state.player.place
end

def player
  args.state.player ||= Player.new args
end

