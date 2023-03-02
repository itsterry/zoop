class Player
  attr_gtk

  def initialize(args)
    @args = args
  end

  def serialize
    sprite
  end

  def show
    args.outputs.sprites << sprite
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
