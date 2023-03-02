class Player
  attr_gtk

  def initialize(args)
    @args = args
    @moving = false
    @zooping = false
  end

  def handle_input(args)
    return if @moving

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
    if @moving
      @direction = @moving
      sprite.path = sprite_path
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
    @background ||= args.state.background
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

  def color
    @color ||= :yellow
  end

  def direction
    @direction ||= :up
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
      path: sprite_path }
  end

  def sprite_path
    "sprites/triangle/equilateral/#{color}-#{direction}.png"
  end
end
