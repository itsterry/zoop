class Line
  attr_gtk

  def initialize(opts)
    @args = opts[:args]
    @x = opts[:x]
    @y = opts[:y]
    @cells = opts[:cells]
    @orientation = opts[:orientation]

    draw_background
  end

  private

  def background
    h = w = SPRITE_WIDTH

    if @orientation == :horizontal
      w = w * @cells
    else
      h = -h * @cells
    end
    {
      x: OFFSET_X + @x,
      y: OFFSET_Y + @y,
      w: w,
      h: h,
      r: 60,
      g: 60,
      b: 60
    }
  end

  def draw_background
    puts background.inspect
    args.outputs.solids << background
  end
end
