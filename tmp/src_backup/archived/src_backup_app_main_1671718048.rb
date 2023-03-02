require 'app/background.rb'
require 'app/player.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick args
  background args
  Player.new args
end

def background(args)
  @background ||= Background.new args
end
