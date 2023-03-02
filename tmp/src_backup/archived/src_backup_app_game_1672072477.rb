class Game
  attr_gtk

  attr_accessor :args

  def initialize(args)
    background args
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
    puts args.state
  end
end
