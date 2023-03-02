class Game
  attr_gtk

  attr_reader :args

  def initialize(args)
    background args
    background.draw
  end

  def tick(args)
    @args = args
  end
end
