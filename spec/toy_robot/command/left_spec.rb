describe ToyRobot::Command::Left do
  let(:robot) { ToyRobot::Robot.new }
  subject(:command) { described_class.new }

  describe "#recognize?" do
    it "knows itself to be a LEFT" do
      expect(command.recognize?("LEFT")).to eq true
    end
  end

  describe "#perform" do
    it "turns te robot 90º left" do
      coord = ToyRobot::Coordinate.new(1, 1)
      robot.place ToyRobot::Position.new(coord, :north)
      command.perform robot

      expect(robot.report).to eq "1,1,WEST"
    end
  end
end
