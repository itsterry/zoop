class Game
  attr_gtk

  attr_accessor :args

  def initialize(args)
    @args = args
    initialize_background
  end

  def setup
    background
    # background.draw
  end

  def tick(args)
    @args = args
    puts args.state.inspect
  end

  private

  def background
    @background ||= args.state.background || initialize_background(args)
  end

  def initialize_background
    @args.state.background = Background.new(args)
  end
end
