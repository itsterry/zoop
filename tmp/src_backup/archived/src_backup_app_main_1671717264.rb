require 'background.rb'

OFFSET_X = 40
OFFSET_Y = 10

def tick args
  Background.new args
  args.outputs.sprites << {i x: 100, y: 100, path: 'sprites/triangle/equilateral/yellow.png'}
end

