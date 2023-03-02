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

  def horizontal?
    left? || right?
  end

  def inspect
    background
  end

  def serialize
    background
  end

  def sprite_start_x
    return start_x unless horizontal? && left?

    start_x - SPRITE_WIDTH
  end

  def sprite_start_y
    return start_y unless vertical? && down?

    start_y - SPRITE_WIDTH
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

  def width_direction_modifier
    left? ? -1 : 1
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

  def finished_moving?
    target = targets.last
    ((target.sprite.x - sprite_start_x) % SPRITE_WIDTH).zero? &&
    ((target.sprite.y - sprite_start_y) % SPRITE_WIDTH).zero?
  end

  def height
    multiplier = horizontal? ? 1 : @cells

    SPRITE_WIDTH  * multiplier
  end

  def left?
    @direction == :left
  end

  def right?
    @direction == :right
  end

  def move
    if targets.empty?
      if pending_target
        targets << pending_target
        @moving = nil
        @pending_target = nil
        return
      end
    end

    targets.each do |target|
      target.move
    end
    if finished_moving?
      @moving = nil
      targets << pending_target if pending_target
      @pending_target = nil
    end
  end

  def start_y
    @start_y ||= @y + OFFSET_Y
  end

  def start_x
    @start_x ||= @x + OFFSET_X
  end

  def stop_moving

  end

  def vertical?
    !horizontal?
  end

  def width
    multiplier = horizontal? ? @cells : 1

    SPRITE_WIDTH  * multiplier
  end
end
