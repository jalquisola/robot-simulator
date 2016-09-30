require "spec_helper"
require "commands/right"

describe Commands::Right do
  let(:robot) { double("robot") }
  let(:command) { Commands::Right.new(robot) }

  describe "#execute" do
    it "turns the robot clockwise" do
      expect(robot).to receive(:turn).with(1)
      command.execute
    end
  end
end
