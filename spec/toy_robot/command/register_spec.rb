describe Command::Register do
  subject(:register) { described_class.new }

  describe "#from" do
    context "UNKNOWN commands" do
      it "handles gracefully unknown commands" do
        expect { register.from "XPTO" }.to_not raise_error
      end

      it "returns an #perform object" do
        expect(register.from "XPTO").to respond_to(:perform)
      end
    end

    context "PLACE X,Y,F" do
      it "knows how to construct a command place from 'PLACE X,Y,F' parameter" do
        command = register.from "PLACE 2,2,NORTH"

        expect(command).to be_a Command::Place
      end

      it "knows how to construct a command place from 'PLACE X,Y,F' parameter" do
        robot = ToyRobot::Robot.new
        command = register.from "PLACE 2,2,NORTH"
        command.perform robot

        expect(robot.report).to eq "2,2,NORTH"
      end
    end

    it "knows the REPORT command" do
      expect(register.from("REPORT")).to be_a Command::Report
    end
  end
end
