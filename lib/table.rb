class Table
  def initialize(width = 5, height = 5)
    @x_range = Range.new(0, width-1)
    @y_range = Range.new(0, height-1)
  end

  def valid?(position)
    @x_range.include?(position.x) && @y_range.include?(position.y)
  end
end
