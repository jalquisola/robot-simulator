module Commands
  class Right

    def initialize(robot)
      @robot = robot
    end

    def execute
      @robot.turn(1)
    end
  end
end
