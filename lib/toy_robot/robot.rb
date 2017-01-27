module ToyRobot
  # Public: Used to inform the client that the robot need to be placed before
  # react to other (existent) commands.
  class NeedToBeInPlace < StandardError; end
  class OutOfLimits < StandardError; end

  # Public: Represents the `Toy Robot` that will actualy move throghout the
  # table. It knows how to execute all the specified commands.
  #
  # Examples
  #
  #   robot = Robot.new
  #   robot.place 2, 2, :north
  #   robot.move
  #   robot.report
  class Robot
    def initialize(table = [5, 5])
      @table = table
    end

    # Public: Used to place the robot on the table in the given position.
    #
    # position - A Position to define the current position and facing direction
    # of a robot.
    #
    # Examples
    #
    #   robot.place Position.new(Direction.new(2, 2), :north)
    #
    # Returns nothing.
    def place(position)
      @position = position
      @placed = true
    end

    # Public: Used to show the client where the Toy Robot is right now.
    #
    # Returns a String with the current position.
    def report
      @position.to_s
    end

    # Public: Used to turn the robot 90º to the left (facing `Direction`).
    #
    # Examples
    #
    #     robot.place Position.new(Direction.new(2, 2), :north)
    #     robot.left
    #     robot.position
    #     # => 2,2,WEST
    #
    # Returns nothing.
    def left
      raise NeedToBeInPlace.new unless @placed
      @position = @position.left
    end

    # Public: Used to turn the robot 90º to the right (facing `Direction`).
    #
    # Examples
    #
    #     robot.place Position.new(Direction.new(2, 2), :north)
    #     robot.right
    #     robot.position
    #     # => 2,2,EAST
    #
    # Returns nothing.
    def right
      raise NeedToBeInPlace.new unless @placed
      @position = @position.right
    end

    # Public: Moves the robot one position in the current facing direction.
    #
    # Examples
    #
    #     robot.place Position.new(Direction.new(2, 2), :north)
    #     robot.move
    #     robot.position
    #     # => 2,3,NORTH
    #
    # Returns nothing.
    def move
      raise NeedToBeInPlace.new unless @placed

      future_move = @position.forward
      if outside_limits?(future_move)
        raise OutOfLimits.new
      end
      @position = future_move
    end

    private

    def outside_limits?(position)
      (position.y < 0 || position.x < 0) ||
        (position.y >= @table[0] || position.x >= @table[1])
    end
  end
end
