require "spec_helper"
require "services/instruction_manager"

describe InstructionManager do
  let(:command) { double("command", execute: nil) }
  let(:command_manager) { double("command_manager", create: command) }

  subject(:instruction_manager) { InstructionManager.new(command_manager) }

  describe "#process" do
    let(:instruction) { "DO SOMETHING" }

    it "creates a command from the instruction using the command factory" do
      expect(command_manager).to receive(:create).with(instruction)
      instruction_manager.process(instruction)
    end

    it "executes the created command" do
      expect(command).to receive(:execute)
      instruction_manager.process(instruction)
    end
  end
end
