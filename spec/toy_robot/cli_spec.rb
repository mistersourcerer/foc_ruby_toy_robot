require "toy_robot/cli"

RSpec.describe ToyRobot::CLI do
  subject(:cli) { described_class.new }

  describe "#run" do
    it "waits for input from user" do
      expect(cli).to receive(:gets)

      cli.run
    end
  end
end
