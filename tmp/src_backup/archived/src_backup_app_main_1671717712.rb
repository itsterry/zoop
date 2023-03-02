require 'background.rb'

OFFSET_X = 40
OFFSET_Y = 10
SPRITE_WIDTH = 50

def tick args
  Background.new args
  @player ||= Player.new args
end

