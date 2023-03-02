require 'app/background.rb'
require 'app/player.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick(args)
  Background.new args
  player(args)
  player.handle_input args
  player.mve args
  player.place
end

def player(args = nil)
  @player ||= begin
                args.state.player = Player.new(args)
              end
end

