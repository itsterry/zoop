require 'app/background.rb'
require 'app/player.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick(args)
  raise background.inspect
  if args.state.tick_count == 1
    Background.new args
    Player.new args
  end
end

