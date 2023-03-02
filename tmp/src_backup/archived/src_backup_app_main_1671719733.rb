require 'app/background.rb'
require 'app/player.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick(args)
  args.state.player = Player.new args
  args.state.player.place
end

def background
  args.state.background ||= Background.new args
end

def player(args = args)
  @player ||= begin
                p = Player.new args
                args.state.player = p
              end
end

