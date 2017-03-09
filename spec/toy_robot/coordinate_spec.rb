describe ToyRobot::Coordinate do
  it "transforms string coord params into integer ones" do
    coordinate = described_class.new "1", "2"

    expect(coordinate.x).to eq 1
    expect(coordinate.y).to eq 2
  end
end
