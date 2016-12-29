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
  end
end
