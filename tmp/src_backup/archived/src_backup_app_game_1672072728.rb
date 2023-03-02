class Game
  attr_gtk

  attr_reader :args

  def initialize(args)
    @args = args
  puts args.inspect
  end

  def setup
    puts args.state.inspect
    # background args
    # background.draw
  end

  def tick(args)
    @args = args
  end

  private

  def background(args = nil)
    @background ||= args.state.background || initialize_background(args)
  end

  def initialize_background(args)
    args.state.background = Background.new(args)
  end
end
