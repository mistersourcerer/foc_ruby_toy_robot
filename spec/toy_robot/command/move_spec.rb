describe ToyRobot::Command::Move do
  let(:robot) { ToyRobot::Robot.new }
  subject(:command) { described_class.new }

  describe "#recognize?" do
    it "knows itself to be a MOVE" do
      expect(command.recognize?("MOVE")).to eq true
    end
  end

  describe "#perform" do
    it "Moves the robot forward" do
      robot.place ToyRobot::Position.new(ToyRobot::Coordinate.new(1, 1), :north)
      command.perform robot

      expect(robot.report).to eq "1,2,NORTH"
    end
  end
end
