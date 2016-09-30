module Commands
  class Left
    RIGHT = 1

    def initialize(robot)
      @robot = robot
    end

    def execute
      @robot.turn(-1)
    end
  end
end
