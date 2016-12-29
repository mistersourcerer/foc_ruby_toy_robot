module ToyRobot
  class Robot
    def place(x, y, facing)
      @x = x
      @y = y
      @facing = facing
    end

    def report
      "#{@x},#{@y},#{@facing.to_s.upcase}"
    end

    def move
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
