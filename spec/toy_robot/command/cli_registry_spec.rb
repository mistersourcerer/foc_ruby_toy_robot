describe ToyRobot::Command::CLIRegistry do
  subject(:registry) { described_class.new }

  context "PLACE X,Y,F" do
    it "knows how to construct a command place from 'PLACE X,Y,F' parameter" do
      command = registry.from "PLACE 2,2,NORTH"

      expect(command).to be_a ToyRobot::Command::Place
    end

    it "knows how to construct a command place from 'PLACE X,Y,F' parameter" do
      robot = ToyRobot::Robot.new
      command = registry.from "PLACE 2,2,NORTH"
      command.perform robot

      expect(robot.report).to eq "2,2,NORTH"
    end
  end

  it "knows the REPORT command" do
    expect(registry.from("REPORT")).to be_a ToyRobot::Command::Report
  end

  it "knows the MOVE command" do
    expect(registry.from("MOVE")).to be_a ToyRobot::Command::Move
  end

  it "knows the RIGHT command" do
    expect(registry.from("RIGHT")).to be_a ToyRobot::Command::Right
  end

  it "knows the LEFT command" do
    expect(registry.from("LEFT")).to be_a ToyRobot::Command::Left
  end

  it "knows the QUIT command" do
    expect(registry.from("QUIT")).to be_a ToyRobot::Command::Quit
  end
end
