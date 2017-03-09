require "toy_robot/cli"

RSpec.describe ToyRobot::CLI do
  let(:quit) do
    ToyRobot::Command::Quit.new.tap do |quit|
      allow(quit).to receive(:exit).with(0)
    end
  end

  let(:registry) do
    ToyRobot::Command::Registry.new.tap { |registry| registry.add quit }
  end

  subject(:cli) { described_class.new(registry: registry) }

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

  describe ".new" do
    it "uses the (default) created instance to fetch commands" do
      registry = double(:registry)
      expect(ToyRobot::Command::CLIRegistry)
        .to receive(:new).and_return registry
      expect(registry).to receive(:from)
        .with("SOME_COMMAND").and_return(ToyRobot::Command::NullCommand.new)

      cli = described_class.new
      expect(cli).to receive(:gets).and_return("SOME_COMMAND", nil)

      cli.run
    end
  end
end
