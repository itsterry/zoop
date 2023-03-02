require 'app/background.rb'
require 'app/player.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick args
  raise @background.inspect
  background args
  player args
end

def background(args)
  @background ||= Background.new args
end

def player(args)
  @player ||= Player.new args
end
