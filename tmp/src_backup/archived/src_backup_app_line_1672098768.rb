class Line
  attr_gtk
  attr_accessor :args
  attr_accessor :targets

  def initialize(opts)
    @args = opts[:args]
    @x = opts[:x]
    @y = opts[:y]
    @cells = opts[:cells]
    @direction = opts[:direction]
    draw_background
  end

  def draw_background
    args.outputs.solids << background
  end

  def inspect
    background
  end

  def serialize
    background
  end

  def sprite_start_x
    start_x
  end

  def sprite_start_y
    start_y + (height_direction_modifier * SPRITE_WIDTH)
  end

  def targets
    @targets ||= args.state.targets = []
  end

  def update(args)
    @args = args
    return if targets.empty?

    targets.each do |target|
      target.args = args
      target.move args
      args.outputs.sprites << target.sprite
    end
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
