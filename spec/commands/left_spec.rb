require "spec_helper"
require "commands/left"

describe Commands::Left do
  let(:robot) { double("robot") }
  let(:command) { Commands::Left.new(robot) }

  describe "#execute" do
    it "turns the robot counter-clockwise" do
      expect(robot).to receive(:turn).with(-1)
      command.execute
    end
  end
end
