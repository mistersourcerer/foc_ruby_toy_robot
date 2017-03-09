require "spec_helper"

describe ToyRobot::Command::Place do
  let(:robot) { ToyRobot::Robot.new }
  let(:command) { described_class.new }

  describe "#perform" do
    it "knows how to place a robot" do
      command.configure "2,2,NORTH"
      command.perform robot

      expect(robot.report).to eq "2,2,NORTH"
    end
  end

  describe "#recognize?" do
    it "returns true for name 'PLACE'" do
      expect(command.recognize? "PLACE").to eq true
    end
  end
end
