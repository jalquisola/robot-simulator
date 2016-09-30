Dir[File.join(File.dirname(__FILE__), "../commands/*.rb")].each do |file|
    require file
end

class CommandManager
  def initialize(robot, io = STDOUT)
    @robot = robot
    @io = io
  end

  def create(instruction)
    if instruction =~ /^PLACE /
      params = instruction.split.last
      Commands::Place.new(@robot, *params.split(","))
    elsif %w(LEFT RIGHT MOVE).include?(instruction)
      Object.const_get("Commands::#{instruction.capitalize}").new(@robot)
    elsif instruction == "REPORT"
      Commands::Report.new(@robot, @io)
    else
      Commands::Unknown.new(instruction, @io)
    end
  end
end
