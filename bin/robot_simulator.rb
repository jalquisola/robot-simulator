#!/usr/bin/env ruby

require File.expand_path("../../lib/robot", __FILE__)
require File.expand_path("../../lib/table", __FILE__)
require File.expand_path("../../lib/services/command_manager", __FILE__)
require File.expand_path("../../lib/services/instruction_manager", __FILE__)

robot = Robot.new(Table.new)
command_factory = CommandManager.new(robot)
instruction_processor = InstructionManager.new(command_factory)

ARGF.each_line { |line| 
  instruction_processor.process(line.strip) 
}
