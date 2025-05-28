# frozen_string_literal: true

RSpec.describe DependencyBot::Checkers do
  describe '.new' do
    it 'initializes with an empty checkers array' do
      checkers = described_class.new
      expect(checkers.checkers).to eq([])
    end
  end

  describe '#add_checker' do
    let(:checker) { double(DependencyBot::Checker::BundleAudit) }

    it 'adds a checker to the checkers array' do
      checkers = described_class.new
      checkers.add_checker(checker)
      expect(checkers.instance_variable_get(:@checkers)).to include(checker)
    end
  end

  describe '#run' do
    let(:checker) { double(DependencyBot::Checker::BundleAudit) }

    it 'calls verify for checker' do
      allow(checker).to receive(:verify)
      checkers = described_class.new
      checkers.add_checker(checker)
      checkers.run

      expect(checker).to have_received(:verify)
    end

    let(:fake_checker) { double('FakeChecker') }

    let(:dp1) { double(DependencyBot::DependencyGem, name: 'gem1') }
    let(:dp2) { double(DependencyBot::DependencyGem, name: 'gem2') }

    it 'returns dependency gems' do
      allow(checker).to receive(:verify).and_return([dp1])
      allow(fake_checker).to receive(:verify).and_return([dp2])

      checkers = described_class.new
      checkers.add_checker(checker)
      checkers.add_checker(fake_checker)

      expect(checkers.run).to eq([dp1, dp2])
    end
  end
end
