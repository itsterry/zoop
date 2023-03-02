class Target
  attr_gtk

  attr_accessor :args
  attr_reader :color, :line, :sprite

  def self.spawn(args)
    return unless line = args.state.lines.first

    puts 'Spawning'
    instance = new(line, args)
    line.targets << instance
  end

  def initialize(line, args)
    @args = args
    @line = line
    @color = :red
    @x = line.sprite_start_x
    @y = line.sprite_start_y
  end

  def inspect
    serialize.to_s
  end

  def move(args)
    @args = args
    @y -= 1
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

  def sprite_path
    "sprites/triangle/equilateral/#{color}.png"
  end
end
