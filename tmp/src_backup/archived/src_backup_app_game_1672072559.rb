class Game
  attr_gtk

  attr_accessor :args

  def initialize(args)
    @args = args
    background args
  end

  def setup
    background.draw
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
