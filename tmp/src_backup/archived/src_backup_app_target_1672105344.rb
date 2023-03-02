class Target
  attr_gtk
  COLORS = %i[blue green indigo orange red violet]

  attr_accessor :args
  attr_reader :color, :line, :sprite

  def self.spawn(args)
    line = args.state.lines.sample

    line.pending_target = new(line, args)
    line.start_moving
  end

  def initialize(line, args)
    @args = args
    @line = line
    @color = COLORS.sample
    @x = line.sprite_start_x
    @y = line.sprite_start_y
  end

  def inspect
    serialize.to_s
  end

  def move
    puts args.state
    line.horizontal? ? move_horizontal : move_vertical
  end

  def serialize
    sprite
  end

  def sprite
    @sprite ||= {
      x: @x,
      y: @y,
      w: SPRITE_WIDTH,
      h: SPRITE_WIDTH,
      path: sprite_path }
  end

  private

  def move_horizontal
    @sprite.x = sprite.x + (line.width_direction_modifier * speed)
  end

  def move_vertical
    @sprite.y = sprite.y + (line.height_direction_modifier * speed)
  end

  def speed
    10
  end

  def sprite_path
    "sprites/square/#{color}.png"
  end
end
