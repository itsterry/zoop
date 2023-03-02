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
    return unless @moving

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

    check_collision
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

  def check_collision
    return if possible_collision_targets.empty?

    possible_collision_targets.each do |target|
      next unless collision?(target)

      collide target
    end
  end

  def check_gamespace
    if sprite.x < background.gamespace.x
      sprite.x = background.gamespace.x
      reverse_direction
    elsif sprite.x > background.gamespace.x  + background.gamespace.w - SPRITE_WIDTH
      sprite.x = background.gamespace.x  + background.gamespace.w - SPRITE_WIDTH
      reverse_direction
    end

    if sprite.y < background.gamespace.y
      sprite.y = background.gamespace.y
      reverse_direction
    elsif sprite.y > background.gamespace.y  + background.gamespace.h - SPRITE_WIDTH
      sprite.y = background.gamespace.y  + background.gamespace.h - SPRITE_WIDTH
      reverse_direction
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

  def collide(target)
    puts target.color
    if target.color == color
      target.line.targets = target.line.targets.map { |t| t == target ? nil : t }.compact
    else
      temp_color = target.color
      target.color = color
      @color = temp_color
      target.line.targets = [target] + target.line.targets[1..]
      reverse_direction
    end
  end

  def collision?(target)
    args.geometry.intersect_rect?(sprite, target.sprite)
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

  def possible_collision_targets
    state.lines.map { |line| line.targets.first }.compact
  end

  def reverse_direction
    @moving = @direction = case direction
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
    # "sprites/triangle/equilateral/#{color}-#{direction}.png"
    "sprites/square/#{color}.png"
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
