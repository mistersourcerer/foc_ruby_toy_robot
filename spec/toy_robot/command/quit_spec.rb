describe ToyRobot::Command::Quit do
  subject(:command) { described_class.new }

  describe "#perform" do
    it "exits the execution" do
      expect(command).to receive(:exit).with(0)

      command.perform(nil)
    end
  end
end
