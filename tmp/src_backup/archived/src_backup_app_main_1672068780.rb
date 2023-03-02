require 'app/background.rb'
require 'app/line.rb'
require 'app/player.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick(args)
  background args
  background(args).draw
  player(args)
  lines(args)
  player.handle_input args
  player.move
  player.place
end

def background(args = nil)
  @background ||= args.state.background || initialize_background(args)
end

def initialize_background(args)
  args.state.background = Background.new(args)
end

def lines(args)
  @lines ||= [Line.new(args: args, x: 500, y: 700, cells: 5, direction: :down)]
end

def player(args = nil)
  @player ||= args.state.player = Player.new(args)
end

