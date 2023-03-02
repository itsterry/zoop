require 'app/background.rb'
require 'app/line.rb'
require 'app/player.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick(args)
  background args
  player(args)
  lines(args)
  player.handle_input args
  player.move
  player.place
end

def background(args)
  @background ||=  begin
                args.state.background = Background.new(args)
              end
end

def lines(args)
  [Line.new(args: args, x: 500, y: args.grid.h - SPRITE_WIDTH, cells: 5, direction: :down)]
end

def player(args = nil)
  @player ||= begin
                args.state.player = Player.new(args)
              end
end

