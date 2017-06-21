module ToyRobot
  module Command
    class Left
      def recognize?(command_string)
        command_string == "LEFT"
      end

      def perform(robot)
        robot.left
      end
    end
  end
end
