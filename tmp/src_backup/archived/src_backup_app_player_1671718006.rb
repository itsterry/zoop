class Player
  attr_gtk

  def initialize(args)
    @args = args

    initialize_sprite
  end

  private

  def background
    @background ||= Background.new args
  end

  def initialize_sprite
    args.outputs.sprites << sprite
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
