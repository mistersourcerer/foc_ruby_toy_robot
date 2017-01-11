module ToyRobot
  module Directions
    def self.[](direction_name)
      @directions = {
        north: North.new,
        west:  West.new,
        south: South.new,
        east:  East.new
      }[direction_name]
    end

    class North
      def left
        West.new
      end

      def right
        East.new
      end

      def to_s
        "NORTH"
      end

      def ==(other)
        other == :north || other.is_a?(self.class)
      end
    end

    class West
      def left
        South.new
      end

      def right
        North.new
      end

      def to_s
        "WEST"
      end

      def ==(other)
        other == :west || other.is_a?(self.class)
      end
    end

    class East
      def left
        North.new
      end

      def right
        South.new
      end

      def to_s
        "EAST"
      end

      def ==(other)
        other == :east || other.is_a?(self.class)
      end
    end

    class South
      def left
        East.new
      end

      def right
        West.new
      end

      def to_s
        "SOUTH"
      end

      def ==(other)
        other == :south || other.is_a?(self.class)
      end
    end
  end
end
