require_relative "table"
require_relative "position"

class Robot
  DIRECTIONS = %w(NORTH EAST SOUTH WEST)

  attr_reader :position, :direction

  def initialize(table)
    @table = table
  end

  def place(new_position, direction)
    move(new_position)
    @direction = direction
  end

  def forward
    move(@position.send(@direction.downcase)) if placed?
  end

  def left
    turn(-1)
  end

  def right
    turn(1)
  end

  def location 
    "#{@position},#{@direction}" if placed?
  end

  def placed?
    !(@position.nil?)
  end

  def turn(steps)
    index = DIRECTIONS.index(@direction)
    @direction = DIRECTIONS.rotate(steps)[index] if placed?
  end

  private

  def move(new_position)
    if @table.valid?(new_position)
      @position = new_position
    end
  end
end
