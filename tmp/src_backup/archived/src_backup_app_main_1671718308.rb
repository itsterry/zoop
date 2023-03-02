require 'app/background.rb'
require 'app/player.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick(args)
  if args.state.tick.count == 1
    @background = Background.new args
    @player = Player.new args
  end
end

