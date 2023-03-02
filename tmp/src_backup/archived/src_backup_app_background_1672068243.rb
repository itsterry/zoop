class Background
  attr_gtk

  def initialize(args)
    @args = args

    draw_gamespace
    draw_home
  end

  def draw
    draw_gamespace
    draw_home
  end

  def player_home
    {
      x: OFFSET_X + 500,
      y: OFFSET_Y + 250,
      w: 200,
      h: 200,
      r: 0,
      g: 0,
      b: 0
    }
  end

  private

  def draw_gamespace
    args.outputs.solids << {
      x: OFFSET_X,
      y: OFFSET_Y,
      w: args.grid.w - (2 * OFFSET_X),
      h: args.grid.h - (2 * OFFSET_Y),
      r: 92,
      g: 120,
      b: 230
    }
  end

  def draw_home
    args.outputs.solids << player_home
  end
end
