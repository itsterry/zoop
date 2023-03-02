class Game
  attr_gtk

  attr_accessor :args

  def initialize(args)
    @args = args
  end

  def setup
    background.draw
    # initialize_lines
  end

  def tick(args)
    @args = args
    Target.spawn args unless args.state.lines.first.targets.any?
    lines.each do |line|
      line.update args
    end
    player.handle_input args
    player.move
    player.place
  end

  private

  def background
    @background ||= args.state.background = Background.new(args)
  end

  def lines
    @lines ||= args.state.lines = [
      Line.new(args: args, x: 500, y: 700, cells: 5, direction: :down),
      # Line.new(args: args, x: 550, y: 700, cells: 5, direction: :down),
      # Line.new(args: args, x: 600, y: 700, cells: 5, direction: :down),
      # Line.new(args: args, x: 650, y: 700, cells: 5, direction: :down),
      #
      # Line.new(args: args, x: 0, y: 250, cells: 10, direction: :right),
      # Line.new(args: args, x: 0, y: 300, cells: 10, direction: :right),
      # Line.new(args: args, x: 0, y: 350, cells: 10, direction: :right),
      # Line.new(args: args, x: 0, y: 400, cells: 10, direction: :right),
      #
      # Line.new(args: args, x: 1200, y: 250, cells: 10, direction: :left),
      # Line.new(args: args, x: 1200, y: 300, cells: 10, direction: :left),
      # Line.new(args: args, x: 1200, y: 350, cells: 10, direction: :left),
      # Line.new(args: args, x: 1200, y: 400, cells: 10, direction: :left),
      #
      # Line.new(args: args, x: 500, y: 0, cells: 5, direction: :up),
      # Line.new(args: args, x: 550, y: 0, cells: 5, direction: :up),
      # Line.new(args: args, x: 600, y: 0, cells: 5, direction: :up),
      # Line.new(args: args, x: 650, y: 0, cells: 5, direction: :up)
    ]
  end

  def player
    @player ||= args.state.player = Player.new(args)
  end
end
