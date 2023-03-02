class Target
  attr_gtk

  attr_reader :line

  def self.spawn(args)
    return unless line = args.state.lines.first
  end

  def initialize(line)
    @line = line
    @color = red
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
