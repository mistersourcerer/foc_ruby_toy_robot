module Command
  class NullCommand
    def configure(_ = nil)
      self
    end

    def perform(_)
      nil
    end
  end

  class Register
    def initialize
      @commands = [
        Command::Place.new,
        Command::Report.new
      ]
    end

    def from(command_string)
      command_name, command_args = command_string.chomp.split " "
      @commands.find(->{ NullCommand.new } ) { |command|
        command.recognize?(command_name)
      }.configure command_args
    end
  end
end
