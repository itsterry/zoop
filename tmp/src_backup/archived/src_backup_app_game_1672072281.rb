class Game
  attr_gtk

  attr_reader :args

  def initialize(args)
  end

  def tick(args)
    @args = args
  end
end
