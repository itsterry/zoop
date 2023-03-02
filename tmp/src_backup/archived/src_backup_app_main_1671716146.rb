def tick args
  draw_background
end

def draw_background(args)
  args.outputs.solids << {
    x:0,
    y: 0,
    w: args.grid.w,
    h: args.grid.h,
    r: 92, g: 120,
    b: 230
  }
end
