require "toy_robot/cli"

RSpec.describe ToyRobot::CLI do
  subject(:cli) { described_class.new }

  describe "#run" do
    it "waits for input from user" do
      expect(cli).to receive(:gets)

      cli.run
    end

    it "waits for user input while there is data to receive" do
      allow(cli).to receive(:gets).and_return("um", "2", "three", nil)

      cli.run
      expect(cli).to have_received(:gets).exactly(4)
    end
  end
end