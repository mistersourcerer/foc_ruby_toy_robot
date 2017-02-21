module ToyRobot
  class CLI
    def run
      while command = gets
        if command.chomp.upcase == "QUIT"
          exit(0)
        end
      end
    end
  end
end
