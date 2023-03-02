class Target
  attr_gtk
  COLORS = %i[blue green indigo orange red violet]

  attr_accessor :args
  attr_reader :color, :line, :sprite

  def self.spawn(args)
    line = args.state.lines.sample

    line.pending_target = new(line, args)
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
    @sprite.y = sprite.y - speed
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

  def speed
    10
  end

  def sprite_path
    "sprites/triangle/equilateral/#{color}.png"
  end
end
