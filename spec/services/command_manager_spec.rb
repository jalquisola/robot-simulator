require "spec_helper"
require "services/command_manager"

describe CommandManager do
  let(:robot) { double("robot", placed?: true) }
  let(:io) { double("io") }
  let(:command_manager) { CommandManager.new(robot, io) }

  describe "#create" do
    context "when processing a PLACE instruction" do
      let(:instruction) { "PLACE 1,2,SOUTH" }

      it "Create a place command with the correct arguments" do
        expect(Commands::Place).to receive(:new).with(robot, "1", "2", "SOUTH")
        command_manager.create(instruction)
      end
    end

    context "when processing a MOVE instruction" do
      let(:instruction) { "MOVE" }

      it "creates a move command" do
        expect(Commands::Move).to receive(:new).with(robot)
        command_manager.create(instruction)
      end
    end

    context "when processing a LEFT instruction" do
      let(:instruction) { "LEFT" }

      it "creates a turn left command" do
        expect(Commands::Left).to receive(:new).with(robot)
        command_manager.create(instruction)
      end
    end

    context "when processing a RIGHT instruction" do
      let(:instruction) { "RIGHT" }

      it "creates a turn right command" do
        expect(Commands::Right).to receive(:new).with(robot)
        command_manager.create(instruction)
      end
    end

    context "when processing a REPORT instruction" do
      let(:instruction) { "REPORT" }

      it "creates a report command" do
        expect(Commands::Report).to receive(:new).with(robot, io)
        command_manager.create(instruction)
      end
    end

    context "when processing an unknown instruction" do
      let(:instruction) { "UNKNOWN" }

      it "creates a null command" do
        expect(Commands::Unknown).to receive(:new).with(instruction, io)
        command_manager.create(instruction)
      end
    end
  end
end
