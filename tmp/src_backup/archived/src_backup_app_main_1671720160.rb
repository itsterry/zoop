require 'app/background.rb'
require 'app/player.rb'
attr_reader :player

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick(args)
  Background.new args
  set_player(args)
  player.place
end

def set_player(args)
  @player ||= begin
                args.state.player = Player.new(args)
              end
end

