OFFSET_X = 40
OFFSET_Y = 10

def tick args
  draw_background args
end

def draw_background(args)
  args.outputs.solids << {
    x: OFFSET_X,
    y: OFFSET_Y,
    w: args.grid.w - OFFSET_X,
    h: args.grid.h - OFFSET_Y,
    r: 92, g: 120,
    b: 230
  }
end
