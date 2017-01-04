module ToyRobot
  class NeedToBeInPlace < StandardError; end

  class Robot
    def place(x, y, facing)
      @x = x
      @y = y
      @facing = facing
      @placed = true
    end

    def report
      "#{@x},#{@y},#{@facing.to_s.upcase}"
    end

    def left
      raise NeedToBeInPlace.new unless @placed

      if @facing == :north
        @facing = :west
      elsif @facing == :west
        @facing = :south
      elsif @facing == :south
        @facing = :east
      elsif @facing == :east
        @facing = :north
      end
    end

    def right
      raise NeedToBeInPlace.new unless @placed

      if @facing == :north
        @facing = :east
      elsif @facing == :east
        @facing = :south
      elsif @facing == :south
        @facing = :west
      elsif @facing == :west
        @facing = :north
      end
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
