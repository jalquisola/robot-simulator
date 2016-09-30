Feature: Robot Simulation

  Scenario: Intruction file is empty
    Given a file named "instructions.txt" with:
      """
      """
    When I successfully run `robot_simulator.rb instructions.txt`
    Then the stdout should contain ""

  Scenario: Intruction file is blank
    Given a file named "instructions.txt" with:
      """



      """
    When I successfully run `robot_simulator.rb instructions.txt`
    Then the stdout should contain ""

  Scenario: The robot is not yet placed.
    Given a file named "instructions.txt" with:
      """
        RIGHT
        MOVE
        LEFT
        MOVE
        REPORT
      """
    When I successfully run `robot_simulator.rb instructions.txt`
    Then the stdout should contain ""

  Scenario: Place the robot outside the table
    Given a file named "instructions.txt" with:
    """
      PLACE 0,5,NORTH
      REPORT
      PLACE 5,0,SOUTH
      REPORT
      PLACE 5,5,EAST
      REPORT
      PLACE -1,0,WEST
      REPORT
      PLACE 0,-1,WEST
      REPORT
    """
    When I successfully run `robot_simulator.rb instructions.txt`
    Then the stdout should not contain anything

  Scenario: Place and move the robot outside the table
    Given a file named "instructions.txt" with:
    """
      PLACE 0,5,NORTH
      MOVE
      REPORT
      PLACE 5,0,SOUTH
      LEFT
      REPORT
      PLACE 5,5,EAST
      RIGHT
      REPORT
    """
    When I successfully run `robot_simulator.rb instructions.txt`
    Then the stdout should not contain anything

  Scenario: Invalid instructions
    Given a file named "instructions.txt" with:
    """
      PLACE 0,2,NORTH
      move
      right
      turn
      left
      place
      REPORT
    """
    When I successfully run `robot_simulator.rb instructions.txt`
    Then the stdout should contain "0,2,NORTH"
    And the stdout should contain "Invalid instruction: move"
    And the stdout should contain "Invalid instruction: right"
    And the stdout should contain "Invalid instruction: turn"
    And the stdout should contain "Invalid instruction: left"
    And the stdout should contain "Invalid instruction: place"

  Scenario: Simple place, move and report
    Given a file named "instructions.txt" with:
      """
        PLACE 0,0,NORTH
        MOVE
        REPORT
      """
    When I successfully run `robot_simulator.rb instructions.txt`
    Then the stdout should contain "0,1,NORTH"

  Scenario: Basic instructions
    Given a file named "instructions.txt" with:
      """
        PLACE 2,2,NORTH
        MOVE
        LEFT
        MOVE
        RIGHT
        MOVE
        REPORT
      """
    When I successfully run `robot_simulator.rb instructions.txt`
    Then the stdout should contain "1,4,NORTH"

  Scenario: Rotate the robot
    Given a file named "instructions.txt" with:
      """
        PLACE 2,2,NORTH
        LEFT
        LEFT
        LEFT
        LEFT
        REPORT
        RIGHT
        RIGHT
        RIGHT
        RIGHT
        REPORT
      """
    When I successfully run `robot_simulator.rb instructions.txt`
    Then the stdout should contain "2,2,NORTH"

  Scenario: Robot on the edge of the table should ignore MOVE command
    Given a file named "instructions.txt" with:
    """
      PLACE 0,0,SOUTH
      MOVE
      REPORT
      PLACE 1,0,SOUTH
      MOVE
      REPORT
      PLACE 2,0,SOUTH
      MOVE
      REPORT
      PLACE 3,0,SOUTH
      MOVE
      REPORT
      PLACE 4,0,SOUTH
      MOVE
      REPORT
      PLACE 0,0,WEST
      MOVE
      REPORT
      PLACE 0,1,WEST
      MOVE
      REPORT
      PLACE 0,2,WEST
      MOVE
      REPORT
      PLACE 0,3,WEST
      MOVE
      REPORT
      PLACE 0,4,WEST
      MOVE
      REPORT
      PLACE 4,0,EAST
      MOVE
      REPORT
      PLACE 4,1,EAST
      MOVE
      REPORT
      PLACE 4,2,EAST
      MOVE
      REPORT
      PLACE 4,3,EAST
      MOVE
      REPORT
      PLACE 4,4,EAST
      MOVE
      REPORT
      PLACE 0,4,NORTH
      MOVE
      REPORT
      PLACE 1,4,NORTH
      MOVE
      REPORT
      PLACE 2,4,NORTH
      MOVE
      REPORT
      PLACE 3,4,NORTH
      MOVE
      REPORT
      PLACE 4,4,NORTH
      MOVE
      REPORT
    """
    When I successfully run `robot_simulator.rb instructions.txt`
    Then the stdout should contain "0,0,SOUTH"
    And the stdout should contain "1,0,SOUTH"
    And the stdout should contain "2,0,SOUTH"
    And the stdout should contain "3,0,SOUTH"
    And the stdout should contain "4,0,SOUTH"
    And the stdout should contain "0,0,WEST"
    And the stdout should contain "0,1,WEST"
    And the stdout should contain "0,2,WEST"
    And the stdout should contain "0,3,WEST"
    And the stdout should contain "0,4,WEST"
    And the stdout should contain "4,0,EAST"
    And the stdout should contain "4,1,EAST"
    And the stdout should contain "4,2,EAST"
    And the stdout should contain "4,3,EAST"
    And the stdout should contain "4,4,EAST"
    And the stdout should contain "0,4,NORTH"
    And the stdout should contain "1,4,NORTH"
    And the stdout should contain "2,4,NORTH"
    And the stdout should contain "3,4,NORTH"
    And the stdout should contain "4,4,NORTH"

