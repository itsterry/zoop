class Player
  attr_gtk
  attr_reader :args
  attr_reader :moving

  def initialize(args)
    @args = args
    @moving = false
  end

  def handle_input(args)
    return if gmoving

    if args.inputs.left
      gmoving = :left
    elsif args.inputs.right
      gmoving = :right
    elsif args.inputs.down
      gmoving = :down
    elsif args.inputs.up
      gmoving = :up
    end
  end

  def move
    return if @zooping

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
    check_home_bounds
    if ((sprite.x - OFFSET_X) % SPRITE_WIDTH).zero? &&
       ((sprite.y - OFFSET_Y) % SPRITE_WIDTH).zero?
      @moving = nil
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

  def check_home_bounds
    if sprite.x < background.player_home.x
      sprite.x = background.player_home.x
    elsif sprite.x > background.player_home.x  + background.player_home.w - SPRITE_WIDTH
      sprite.x = background.player_home.x  + background.player_home.w - SPRITE_WIDTH
    end

    if sprite.y < background.player_home.y
      sprite.y = background.player_home.y
    elsif sprite.y > background.player_home.y  + background.player_home.h - SPRITE_WIDTH
      sprite.y = background.player_home.y  + background.player_home.h - SPRITE_WIDTH
    end
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
