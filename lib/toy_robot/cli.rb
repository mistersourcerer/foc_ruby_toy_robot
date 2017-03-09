module ToyRobot
  class CLI
    def initialize(registry: ToyRobot::Command::CLIRegistry.new)
      @robot = ToyRobot::Robot.new
      @registry = registry
    end

    def run
      while command = gets
        command = @registry.from command
        command.perform @robot
      end
    end
  end
end
