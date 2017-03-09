module ToyRobot
  class CLI
    def initialize
      @robot = ToyRobot::Robot.new
    end

    def run
      while command = gets
        if command.chomp.upcase == "QUIT"
          exit(0)
        end

        register = Command::Register.new
        command = register.from command
        command.perform @robot
      end
    end
  end
end
