describe ToyRobot::Command::Registry do
  subject(:registry) { described_class.new }

  describe "#from" do
    context "UNKNOWN commands" do
      it "handles gracefully unknown commands" do
        expect { registry.from "XPTO" }.to_not raise_error
      end

      it "returns an #perform object" do
        expect(registry.from "XPTO").to respond_to(:perform)
      end
    end

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
  end

  describe "#add" do
    class MyCustomCommand
      def configure(_); self; end
      def recognize?(command); command == "SUCH_COMMAND" end
      def perform; puts "SO STDOUT" end
    end

    it "adds a custom command to `Registry`" do
      registry.add MyCustomCommand.new

      expect(registry.from("SUCH_COMMAND")).to be_a MyCustomCommand
    end
  end
end
