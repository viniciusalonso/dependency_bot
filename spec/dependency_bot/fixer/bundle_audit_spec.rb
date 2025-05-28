# frozen_string_literal: true

RSpec.describe DependencyBot::Fixer::BundleAudit do
  let(:fixer) { described_class.new(dependency) }
  let(:dependency) { double(DependencyBot::DependencyGem, name: 'rails') }

  describe '#fix' do
    before do
      allow(Kernel).to receive(:exec)
    end

    it "calls kernel exec" do
      fixer.fix
      expect(Kernel).to have_received(:exec).with("bundle update rails")
    end
  end

  describe '#branch_name' do
    it "returns correct branch name" do
      expect(fixer.branch_name).to eq("update-rails")
    end
  end

  describe '#commit_message' do
    it "returns correct commit message" do
      expect(fixer.commit_message).to eq("Update rails to fix security vulnerabilities")
    end
  end
end
