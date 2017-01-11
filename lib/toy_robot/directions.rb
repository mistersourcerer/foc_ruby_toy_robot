module ToyRobot
  module Directions
    DIRECTIONS_MAP = {
      north: North.instance,
      west:  West.instance,
      south: South.instance,
      east:  East.instance
    }

    def self.[](direction_name)
      DIRECTIONS_MAP[direction_name]
    end
  end
end
