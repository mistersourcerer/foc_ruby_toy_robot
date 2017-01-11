module ToyRobot
  # Public: Used to inform the client that the robot need to be placed before
  # react to other (existent) commands.
  class NeedToBeInPlace < StandardError; end

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
    # Public: Used to place the robot on the table in the given position.
    #
    # x       - An Integer representing the x coordinate.
    # y       - An Integer representing the y coordinate.
    # facing  - A Symbol with the direction the robot is facing.
    #
    # Examples
    #
    #   robot.place 2, 2, :north
    #
    # Returns nothing.
    def place(x, y, facing)
      @x = x
      @y = y
      @facing = ToyRobot::Directions[facing]
      @placed = true
    end

    # Public: Used to show the client where the Toy Robot is right now.
    def report
      "#{@x},#{@y},#{@facing.to_s.upcase}"
    end

    def left
      raise NeedToBeInPlace.new unless @placed
      @facing = @facing.left
    end

    def right
      raise NeedToBeInPlace.new unless @placed
      @facing = @facing.right
    end

    def move
      raise NeedToBeInPlace.new unless @placed

      if @facing == :north
        @y += 1
      elsif @facing == :east
        @x += 1
      elsif @facing == :south
        @y -= 1
      elsif @facing == :west
        @x -= 1
      end
    end
  end
end
