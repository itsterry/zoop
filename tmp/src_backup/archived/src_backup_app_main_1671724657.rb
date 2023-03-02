require 'app/background.rb'
require 'app/line.rb'
require 'app/player.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick(args)
  Background.new args
  player(args)
  lines(args)
  player.handle_input args
  player.move
  player.place
end


def lines(args)
  line = Line.new args: args, x: 250, y: args.grid.h
  [line]
end

def player(args = nil)
  @player ||= begin
                args.state.player = Player.new(args)
              end
end

