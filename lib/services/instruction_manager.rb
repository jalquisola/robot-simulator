require File.expand_path("../command_manager", __FILE__)

class InstructionManager
  def initialize(command_manager)
    @command_manager = command_manager
  end

  def process(instruction)
    command = @command_manager.create(instruction)
    command.execute
  end
end
