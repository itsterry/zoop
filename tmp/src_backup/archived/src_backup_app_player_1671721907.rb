class Player
  attr_gtk

  def initialize(args)
    @args = args
  end

  def handle_input(args)
    if args.inputs.left
      @moving = :left
    elsif args.inputs.right
      @moving = :right
    elsif args.inputs.down
      @moving = :down
    elsif args.inputs.up
      @moving = :up
    end
  end

  def mve(args)
    return unless @moving

    puts args.inspect
    case @moving
    when :left
      args.state.player.sprite.x -= args.state.player.speed
    when :right
      args.state.player.sprite.x += args.state.player.speed
    when :down
      args.state.player.sprite.y -= args.state.player.speed
    when :up
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
