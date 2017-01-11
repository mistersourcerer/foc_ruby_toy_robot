describe ToyRobot::Directions do
  subject(:directions) { described_class }

  describe "[]" do
    it "creates a North direction when a :north symbol is passed" do
      north = directions[:north]

      expect(north).to be_a ToyRobot::Directions::North
    end

    it "returns correct direction after calling #[] with a different symbol" do
      directions[:north]
      west = directions[:west]

      expect(west).to be_a ToyRobot::Directions::West
    end
  end

  describe ToyRobot::Directions::North do
    subject(:north) { described_class.new }

    it "knows which direction is at 90º left" do
      expect(north.left).to be_a ToyRobot::Directions::West
    end

    it "knows which direction is at 90º right" do
      expect(north.right).to be_a ToyRobot::Directions::East
    end
  end

  describe ToyRobot::Directions::West do
    subject(:west) { described_class.new }

    it "knows which direction is at 90º left" do
      expect(west.left).to be_a ToyRobot::Directions::South
    end

    it "know which direction is at 90º right" do
      expect(west.right).to be_a ToyRobot::Directions::North
    end
  end

  describe ToyRobot::Directions::South do
    subject(:south) { described_class.new }

    it "knows which direction is at 90º left" do
      expect(south.left).to be_a ToyRobot::Directions::East
    end

    it "knows which direction is at 90º right"do
      expect(south.right).to be_a ToyRobot::Directions::West
    end
  end

  describe ToyRobot::Directions::East do
    subject(:east) { described_class.new }

    it "knows which direction is at 90º left" do
      expect(east.left).to be_a ToyRobot::Directions::North
    end

    it "knows which direction is at 90º right" do
      expect(east.right).to be_a ToyRobot::Directions::South
    end
  end
end
