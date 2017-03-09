module ToyRobot
  module Command
    class Move
      def configure(_)
        self
      end

      def recognize?(command_string)
        command_string == "MOVE"
      end

      def perform(robot)
        robot.move
      end
    end
  end
end
