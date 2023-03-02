class Player
  attr_gtk

  def initialize(args)
    @args = args
  end

  def handle_input(args)
    if args.inputs.left
      args.state.player.sprite.x -= args.state.player.speed
    elsif args.inputs.right
      args.state.player.sprite.x += args.state.player.speed
    end

    if args.inputs.down
      args.state.player.sprite.y -= args.state.player.speed
    elsif args.inputs.up
      args.state.player.sprite.y += args.state.player.speed
    end
  end

  def place
    args.outputs.sprites << sprite
  end

  def serialize(args)
    sprite
  end

  def speed
    10
  end

  private

  def background
    @background ||= Background.new args
  end

  def sprite
    @sprite ||= {
      x: background.player_home.x,
      y: background.player_home.y,
      w: SPRITE_WIDTH,
      h: SPRITE_WIDTH,
      path: 'sprites/triangle/equilateral/yellow.png' }
  end
end
