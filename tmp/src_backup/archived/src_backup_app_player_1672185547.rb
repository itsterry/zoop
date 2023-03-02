class Player
  attr_gtk

  def initialize(args)
    @args = args
    @moving = false
    @zooping = false
  end

  def handle_input(args)
    return if @moving

    if inputs.left
      @moving = :left
      zoop if zoop_left?
    elsif inputs.right
      @moving = :right
      zoop if zoop_right?
    elsif inputs.down
      @moving = :down
      zoop if zoop_down?
    elsif inputs.up
      @moving = :up
      zoop if zoop_up?
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

    if @moving
      @direction = @moving unless @zooping
      sprite.path = sprite_path
    end


    stop_zooping if inside_home_bounds?
    return zoop if @zooping

    check_home_bounds
    if ((sprite.x - OFFSET_X) % SPRITE_WIDTH).zero? &&
       ((sprite.y - OFFSET_Y) % SPRITE_WIDTH).zero?
      @moving = nil
    end
  end

  def place
    outputs.sprites << sprite
  end

  def serialize(args)
    sprite
  end

  private

  def background
    @background ||= state.background
  end

  def check_gamespace
    if sprite.x < background.gamespace.x
      sprite.x = background.gamespace.x
      @moving = @direction = :right
    elsif sprite.x > background.gamespace.x  + background.gamespace.w - SPRITE_WIDTH
      sprite.x = background.gamespace.x  + background.gamespace.w - SPRITE_WIDTH
      @moving = @direction = :left
    end

    if sprite.y < background.gamespace.y
      sprite.y = background.gamespace.y
      @moving = @direction = :up
    elsif sprite.y > background.gamespace.y  + background.gamespace.h - SPRITE_WIDTH
      sprite.y = background.gamespace.y  + background.gamespace.h - SPRITE_WIDTH
      @moving = @direction = :down
    end
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

  def inside_home_bounds?
    args.geometry.intersect_rect?(sprite, background.player_home)
  end

  def outside_gamespace?
    !args.geometry.intersect_rect?(sprite, background.gamespace)
  end

  def reverse_direction
    @direction = case direction
                 when :left
                   :right
                 when :right
                   :left
                 when :up
                   :down
                 when :down
                   :up
                 end
  end

  def speed
    @speed ||= 10
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

  def stop_zooping
    @zooping = nil
    @speed = 10
  end

  def zoop
    @zooping = true
    @speed = 50
    check_gamespace
  end

  def zoop_down?
    sprite.y == background.player_home.y
  end

  def zoop_left?
    sprite.x == background.player_home.x
  end

  def zoop_right?
    sprite.x == background.player_home.x  + background.player_home.w - SPRITE_WIDTH
  end

  def zoop_up?
    sprite.y == background.player_home.y  + background.player_home.h - SPRITE_WIDTH
  end
end
