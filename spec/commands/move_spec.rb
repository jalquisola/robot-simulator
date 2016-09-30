require "spec_helper"
require "commands/move"

describe Commands::Move do
  let(:robot) { double("robot") }
  subject(:command) { Commands::Move.new(robot) }

  describe '#execute' do
    it 'tells the robot to move' do
      expect(robot).to receive(:forward)
      command.execute
    end
  end
end
