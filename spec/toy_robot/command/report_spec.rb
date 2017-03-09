describe ToyRobot::Command::Report do
  let(:robot) { ToyRobot::Robot.new }
  subject(:command) { described_class.new }

  describe "#perform" do
    it "outputs to stdout the Robot#report" do
      coordinate = ToyRobot::Coordinate.new(1, 1)
      robot.place(ToyRobot::Position.new(coordinate, "NORTH"))

      expect { command.perform(robot) }.to output("1,1,NORTH\n").to_stdout
    end
  end

  describe "#recognized?" do
    it "returns true when given 'REPORT'" do
      expect(command.recognize?('REPORT')).to eq true
    end
  end
end
