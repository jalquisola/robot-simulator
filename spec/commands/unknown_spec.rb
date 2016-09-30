require "commands/unknown"

describe Commands::Unknown do
  let(:io) { double("io") }

  subject(:command) { Commands::Unknown.new("testmove", io) }

  describe '#execute' do
    it 'outputs the unknown instruction' do
      expect(io).to receive(:puts).with("Invalid instruction: testmove")
      command.execute
    end
  end
end
