describe ToyRobot::Command::CLIRegistry do
  let(:registry) { double("Underlying Registry").as_null_object }

  it { is_expected.to respond_to(:from).with(1).argument }
  it { is_expected.to respond_to(:add).with(1).argument }

  it "registers all command line recognizable commands" do
    [
      ToyRobot::Command::Place,
      ToyRobot::Command::Report,
      ToyRobot::Command::Move,
      ToyRobot::Command::Right,
      ToyRobot::Command::Left,
      ToyRobot::Command::Quit
    ].each do |command_type|
      expect(registry).to receive(:add).with(kind_of(command_type))
    end

    described_class.new registry
  end

  it "uses Registry as a default underlying register" do
    some_command = double "some command"
    expect(ToyRobot::Command::Registry).to receive(:new).and_return registry
    expect(registry).to receive(:add).with some_command

    cli_registry = described_class.new
    cli_registry.add some_command
  end
end
