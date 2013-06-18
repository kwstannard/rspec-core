require "spec_helper"

module RSpec::Core::Ordering
  describe RandomOrdering do
    it 'shuffles the items randomly' do
      expect(Kernel).to receive(:rand).and_return(3, 1, 4, 2)

      strategy = RandomOrdering.new
      expect(strategy.order([1, 2, 3, 4])).to eq([2, 4, 1, 3])
    end

    it 'seeds the random number generator' do
      allow(Kernel).to receive(:srand)
      expect(Kernel).to receive(:srand).with(1234).once

      configuration = RSpec::Core::Configuration.new
      configuration.seed = 1234

      strategy = RandomOrdering.new(configuration)
      strategy.order([1, 2, 3, 4])
    end

    it 'resets random number generation' do
      allow(Kernel).to receive(:srand)
      expect(Kernel).to receive(:srand).with(no_args)

      strategy = RandomOrdering.new
      strategy.order([])
    end

    it 'is considered a built in ordering' do
      expect(RandomOrdering.new).to be_built_in
    end
  end
end
