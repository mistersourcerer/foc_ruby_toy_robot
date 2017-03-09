module ToyRobot
  class Coordinate
    attr_reader :x, :y

    def initialize(x, y)
      @x = Integer(x)
      @y = Integer(y)
    end

    def to_s
      "#{@x},#{@y}"
    end
  end
end
