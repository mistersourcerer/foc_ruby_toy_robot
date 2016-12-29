RSpec.describe ToyRobot::Robot do
  subject(:robot) { ToyRobot::Robot.new }

  describe "#place" do
    it "places the robot on the table" do
      robot.place 0, 0, :south

      expect(robot.report).to eq "0,0,SOUTH"
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
