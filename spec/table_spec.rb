require "spec_helper"
require "table"
require "position"

describe Table do
  let(:table) { Table.new(5,5) }

  describe "#valid?" do
    it "returns false when x position is negative" do
      position = Position.new(-1,3)
      expect(table.valid?(position)).to be false
    end

    it "returns false when x position is more than 5" do
      position = Position.new(6,4)
      expect(table.valid?(position)).to be false
    end

    it "returns false when y position is negative" do
      position = Position.new(3,-1)
      expect(table.valid?(position)).to be false
    end

    it "returns false when y position is more than 5" do
      position = Position.new(4,6)
      expect(table.valid?(position)).to be false
    end

    it "returns true when co-ordinates inside 5x5 table " do
      position = Position.new(1,2)
      expect(table.valid?(position)).to be true
    end
  end
end
