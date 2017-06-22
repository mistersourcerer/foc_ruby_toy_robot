require "forwardable"

module ToyRobot
  module Command
    class CLIRegistry
      extend Forwardable
      def_delegators :@registry, :from, :add

      def initialize(registry = Registry.new)
        @registry = registry
        [
          Place.new,
          Report.new,
          Move.new,
          Right.new,
          Left.new,
          Quit.new
        ].each { |command| @registry.add command }
      end
    end
  end
end
