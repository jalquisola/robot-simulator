module Commands
  class Unknown
    def initialize(instruction, io)
      @instruction = instruction
      @io = io
    end

    def execute
      @io.puts "Invalid instruction: #{@instruction}"
    end
  end
end
