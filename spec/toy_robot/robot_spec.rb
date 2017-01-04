RSpec.describe ToyRobot::Robot do
  subject(:robot) { ToyRobot::Robot.new }

  describe "#place" do
    it "places the robot on the table" do
      robot.place 0, 0, :south

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
      robot.place 0, 0, :north
    end

    it "allows to move it" do
      expect { robot.move }.to_not raise_error
      expect { robot.left }.to_not raise_error
      expect { robot.right }.to_not raise_error
    end
  end

  describe "#move" do
    it "moves robot one unit when facing north" do
      robot.place 0, 0, :north
      robot.move

      expect(robot.report).to eq "0,1,NORTH"
    end

    it "moves robot one unit when facing east" do
      robot.place 0, 0, :east
      robot.move

      expect(robot.report).to eq "1,0,EAST"
    end

    it "moves robot one unit when facing south" do
      robot.place 0, 4, :south
      robot.move

      expect(robot.report).to eq "0,3,SOUTH"
    end

    it "moves robot one unit when facing west" do
      robot.place 4, 4, :west
      robot.move

      expect(robot.report).to eq "3,4,WEST"
    end
  end
end
