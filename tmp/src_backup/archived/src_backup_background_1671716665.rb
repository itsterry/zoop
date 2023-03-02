class Background
  attr_gtk

  def initialize(args)
    draw_gamespace
  end

  def draw_gamespace
    args.outputs.solids << {
      x: OFFSET_X,
      y: OFFSET_Y,
      w: args.grid.w - (2 * OFFSET_X),
      h: args.grid.h - (2 * OFFSET_Y),
      r: 92, g: 120,
      b: 230
    }
  end
end
