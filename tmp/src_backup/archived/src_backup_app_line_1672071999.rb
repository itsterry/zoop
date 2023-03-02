class Line
  attr_gtk

  def initialize(opts)
    @args = opts[:args]
    @x = opts[:x]
    @y = opts[:y]
    @cells = opts[:cells]
    @direction = opts[:direction]

    draw_background
  end

  private

  def background
    {
      x: OFFSET_X + @x,
      y: OFFSET_Y + @y,
      w: width * width_direction_modifier,
      h: height * height_direction_modifier,
      r: 60,
      g: 60,
      b: 60
    }
  end

  def down?
    @direction == :down
  end

  def draw_background
    puts background.inspect
    args.outputs.solids << background
  end

  def height
    multiplier = horizontal? ? 1 : @cells

    SPRITE_WIDTH  * multiplier
  end

  def height_direction_modifier
    down? ? -1 : 1
  end

  def horizontal?
    left? || right?
  end

  def left?
    @direction == :left
  end

  def right?
    @direction == :right
  end

  def vertical?
    !horizontal?
  end

  def width
    multiplier = horizontal? ? @cells : 1

    SPRITE_WIDTH  * multiplier
  end

  def width_direction_modifier
    left? ? -1 : 1
  end

end
