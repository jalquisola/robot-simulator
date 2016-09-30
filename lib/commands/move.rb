module Commands
  class Move
    def initialize(robot)
      @robot = robot
    end

    def execute
      @robot.forward
    end
  end
end

