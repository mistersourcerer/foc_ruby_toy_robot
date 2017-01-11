require "singleton"

module ToyRobot
  module Directions
    class North
      include Singleton

      def left
        West.instance
      end

      def right
        East.instance
      end

      def to_s
        "NORTH"
      end

      def ==(other)
        other == :north || other.is_a?(self.class)
      end
    end

    class West
      include Singleton

      def left
        South.instance
      end

      def right
        North.instance
      end

      def to_s
        "WEST"
      end

      def ==(other)
        other == :west || other.is_a?(self.class)
      end
    end

    class East
      include Singleton

      def left
        North.instance
      end

      def right
        South.instance
      end

      def to_s
        "EAST"
      end

      def ==(other)
        other == :east || other.is_a?(self.class)
      end
    end

    class South
      include Singleton

      def left
        East.instance
      end

      def right
        West.instance
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
