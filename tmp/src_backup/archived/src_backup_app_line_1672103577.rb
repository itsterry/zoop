class Line
  attr_gtk
  attr_accessor :pending_target, :targets

  def initialize(opts)
    @args = opts[:args]
    @x = opts[:x]
    @y = opts[:y]
    @cells = opts[:cells]
    @direction = opts[:direction]
    @moving = nil
    @pending_target = nil
    draw_background
  end

  def draw_background
    args.outputs.solids << background
  end

  def height_direction_modifier
    down? ? -1 : 1
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

  def start_moving
    @moving = true

  end

  def targets
    @targets ||= args.state.targets = []
  end

  def update
    move if @moving
    targets.each do |target|
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

  def horizontal?
    left? || right?
  end

  def left?
    @direction == :left
  end

  def right?
    @direction == :right
  end

  def move
    @moving = true
    targets.each do |target|
      target.move
      if ((target.sprite.x - sprite_start_x) % SPRITE_WIDTH).zero? &&
          ((target.sprite.y - sprite_start_y) % SPRITE_WIDTH).zero?
        @moving = nil
      end
    end
    targets << pending_target if pending_target
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
