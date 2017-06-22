describe ToyRobot::Command::Registry do
  subject(:registry) { described_class.new }

  describe "#add" do
    class MyCustomCommand
      def recognize?(command); command == "SUCH_COMMAND" end
    end

    it "adds a custom command to `Registry`" do
      command = MyCustomCommand.new
      expect(command).to receive(:perform)
      registry.add command

      registry.from("SUCH_COMMAND").perform
    end
  end

  describe "#from" do
    context "Handling arguments" do
      class CustomCommand
        def recognize?(command); command == "SUCH_COMMAND"; end
      end

      it "passes arguments to command `#configure`" do
        command = CustomCommand.new
        registry.add command
        expect(command).to receive(:configure).with("MUCH,ARGUMENTS")

        registry.from "SUCH_COMMAND MUCH,ARGUMENTS"
      end
    end

    context "UNKNOWN commands" do
      it "handles gracefully unknown commands" do
        expect { registry.from "XPTO" }.to_not raise_error
      end

      it "returns an #perform object" do
        expect(registry.from "XPTO").to respond_to(:perform)
      end
    end
  end
end
