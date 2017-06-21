module ToyRobot
  module Command
    class NullCommand
      def perform(_)
        nil
      end
    end

    class Router < SimpleDelegator
      def initialize(target)
        __setobj__(target)
      end

      def configure(*args, &block)
        return nil unless __getobj__.respond_to?(:configure)
        __getobj__.public_send(:configure, *args, &block)
      end
    end

    class Registry
      def from(command_string)
        command_name, command_args = command_string.chomp.split " "
        found_command = Router.new(command_by_name(command_name))
        found_command.tap { |command| command.configure command_args }
      end

      def add(command)
        commands << command
      end

      private

      def command_by_name(name)
        commands.find(->{ NullCommand.new } ) { |command|
          command.recognize?(name)
        }
      end

      def commands
        @commands ||= []
      end
    end
  end
end
