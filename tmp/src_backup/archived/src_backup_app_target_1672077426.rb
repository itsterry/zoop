class Target
  attr_gtk

  attr_reader :color, :line, :sprite

  def self.spawn(args)
    return unless line = args.state.lines.first

    instance = new(line)
    line.targets << instance
  end

  def initialize(line)
    @line = line
    @color = :red
  end

  def move
    @y -= 1
  end

  def sprite
    @sprite ||= {
      x: line.sprite_start_x,
      y: line.sprite_start_y,
      w: SPRITE_WIDTH,
      h: SPRITE_WIDTH,
      path: sprite_path }
  end

  private

  def sprite_path
    "sprites/triangle/equilateral/#{color}.png"
  end
end
