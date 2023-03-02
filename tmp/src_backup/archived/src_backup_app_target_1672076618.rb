class Target
  attr_gtk

  attr_reader :color, :line, :sprite

  def self.spawn(args)
    return unless line = args.state.lines.first

    instance = new(line)
    line.targets << instance
    puts line.targets
  end

  def initialize(line)
    @line = line
    @color = :red
  end

  def sprite
    @sprite ||= {
      x: line.start_x,
      y: line.start_y,
      w: SPRITE_WIDTH,
      h: SPRITE_WIDTH,
      path: sprite_path }
  end

  def sprite_path
    "sprites/triangle/equilateral/#{color}.png"
  end
end
