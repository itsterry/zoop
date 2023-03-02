class Player
  attr_gtk

  def initialize(args)
    @args = args
    @moving = false
  end

  def handle_input(args)
    if args.inputs.left
      sprite.x -= speed
    elsif args.inputs.right
      args.state.player.sprite.x += args.state.player.speed
    elsif args.inputs.down
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

  private

  def background
    @background ||= Background.new args
  end

  def speed
    10
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
