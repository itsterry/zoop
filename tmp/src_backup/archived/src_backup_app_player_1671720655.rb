class Player
  attr_gtk

  def initialize(args)
    @args = args
  end

  def handle_input(args)
  end

  def place
    args.outputs.sprites << sprite
  end

  def serialize(args)
    sprite
  end

  def speed
    5
  end

  private

  def background
    @background ||= Background.new args
  end

  def sprite
    {
      x: background.player_home.x,
      y: background.player_home.y,
      w: SPRITE_WIDTH,
      h: SPRITE_WIDTH,
      path: 'sprites/triangle/equilateral/yellow.png' }
  end
end
