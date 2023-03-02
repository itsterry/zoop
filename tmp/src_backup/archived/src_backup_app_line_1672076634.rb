class Line
  attr_gtk
  attr_accessor :targets

  def initialize(opts)
    @args = opts[:args]
    @x = opts[:x]
    @y = opts[:y]
    @cells = opts[:cells]
    @direction = opts[:direction]
    @targets = []

    draw_background
  end

  def inspect
    background
  end

  def serialize
    background
  end

  def update
    puts targets.inspect
    return if targets.empty?

    args.outputs.sprites << targets.map(&:sprite)
  end

  private

  def background
    {
      x: start_x,
      y: start_y,
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

  def start_y
    @start_y ||= @y + OFFSET_Y
  end

  def start_x
    @start_x ||= @x + OFFSET_X
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
