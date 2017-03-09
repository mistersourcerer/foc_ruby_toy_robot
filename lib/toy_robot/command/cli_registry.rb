module ToyRobot
  module Command
    class CLIRegistry < Registry
      def initialize
        [
          Place.new,
          Report.new,
          Move.new,
          Right.new,
          Left.new,
          Quit.new
        ].each { |command| add command }
      end
    end
  end
end
