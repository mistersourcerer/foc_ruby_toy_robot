RSpec.describe ToyRobot::Robot do
  subject(:robot) { ToyRobot::Robot.new }

  describe "#place" do
    it "places the robot on the table" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :south)

      expect(robot.report).to eq "0,0,SOUTH"
    end
  end

  context "It hasn't been placed" do
    it "refuses to move" do
      expect { robot.move }.to raise_error ToyRobot::NeedToBeInPlace
      expect { robot.left }.to raise_error ToyRobot::NeedToBeInPlace
      expect { robot.right }.to raise_error ToyRobot::NeedToBeInPlace
    end
  end

  context "It is placed" do
    before do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :north)
    end

    it "allows to move it" do
      expect { robot.move }.to_not raise_error
      expect { robot.left }.to_not raise_error
      expect { robot.right }.to_not raise_error
    end
  end

  describe "#move" do
    it "moves robot one unit when facing north" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :north)
      robot.move

      expect(robot.report).to eq "0,1,NORTH"
    end

    it "moves robot one unit when facing east" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :east)
      robot.move

      expect(robot.report).to eq "1,0,EAST"
    end

    it "moves robot one unit when facing south" do
      direction = ToyRobot::Coordinate.new(0, 4)
      robot.place ToyRobot::Position.new(direction, :south)
      robot.move

      expect(robot.report).to eq "0,3,SOUTH"
    end

    it "moves robot one unit when facing west" do
      coordinate = ToyRobot::Coordinate.new(4, 4)
      robot.place ToyRobot::Position.new(coordinate, :west)
      robot.move

      expect(robot.report).to eq "3,4,WEST"
    end

    context "when movement will drop the robot from the table" do
      it "refuses to move to SOUTH when on the 0,0 (limit) position" do
        coordinate = ToyRobot::Coordinate.new(2, 0)
        robot.place ToyRobot::Position.new(coordinate, :south)

        expect { robot.move }.to raise_error(ToyRobot::OutOfLimits)
      end

      it "refuses to move to WEST when on the 0,0 (limit) position" do
        coordinate = ToyRobot::Coordinate.new(0, 2)
        robot.place ToyRobot::Position.new(coordinate, :west)

        expect { robot.move }.to raise_error(ToyRobot::OutOfLimits)
      end

      it "refuses to move to NORTH when on the 0,0 (limit) position" do
        coordinate = ToyRobot::Coordinate.new(0, 4)
        robot.place ToyRobot::Position.new(coordinate, :north)

        expect { robot.move }.to raise_error(ToyRobot::OutOfLimits)
      end

      it "refuses to move to EAST when on the 0,0 (limit) position" do
        coordinate = ToyRobot::Coordinate.new(4, 0)
        robot.place ToyRobot::Position.new(coordinate, :east)

        expect { robot.move }.to raise_error(ToyRobot::OutOfLimits)
      end
    end

    context "when table has different size limits on x and y" do
      it "knows that it can move until the current axis/direction limit" do
        robot = ToyRobot::Robot.new([5, 3])
        coordinate = ToyRobot::Coordinate.new(3, 0)
        robot.place ToyRobot::Position.new(coordinate, :north)

        expect { robot.move }.to_not raise_error
      end
    end
  end

  describe "#left" do
    it "faces west, when facing north" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :north)
      robot.left

      expect(robot.report).to eq "0,0,WEST"
    end

    it "faces south, when facing west" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :west)
      robot.left

      expect(robot.report).to eq "0,0,SOUTH"
    end

    it "faces east, when facing south" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :south)
      robot.left

      expect(robot.report).to eq "0,0,EAST"
    end

    it "faces north, when facing east" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :east)
      robot.left

      expect(robot.report).to eq "0,0,NORTH"
    end
  end

  describe "#right" do
    it "faces east, when facing north" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :north)
      robot.right

      expect(robot.report).to eq  "0,0,EAST"
    end

    it "faces south, when facing east" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :east)
      robot.right

      expect(robot.report).to eq "0,0,SOUTH"
    end

    it "faces west, when facing south" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :south)
      robot.right

      expect(robot.report).to eq "0,0,WEST"
    end

    it "faces north, when facing west" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :west)
      robot.right

      expect(robot.report).to eq "0,0,NORTH"
    end
  end
end
