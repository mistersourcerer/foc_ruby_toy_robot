module ToyRobot
  module Command
    class Quit
      def configure(_)
        self
      end

      def recognize?(command_string)
        command_string.downcase == "quit" ||
          command_string.downcase == "/q"
      end

      def perform(_)
        exit(0)
      end
    end
  end
end
