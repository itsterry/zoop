class Player
  attr_gtk

  def initialize(args)
    @args = args
    @moving = false
  end

  def handle_input(args)
    if args.inputs.left
      @moving = :left
    elsif args.inputs.right
      sprite.x += speed
    elsif args.inputs.down
      sprite.y -= speed
    elsif args.inputs.up
      sprite.y += speed
    end
  end

  def move
    case @moving
    when :left
      sprite.x -= speed
    when :right
      sprite.x += speed
    when :down
      sprite.y -= speed
    when :up
      sprite.y += speed
    end
    puts sprite.inspect
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
