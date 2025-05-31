# frozen_string_literal: true

require "bundler/audit/scanner"
require "bundler/audit/database"

RSpec.describe DependencyBot::Checker::BundleAudit do
  describe "#verify" do
    let(:checker) { described_class.new }
    let(:scanner) { instance_double(Bundler::Audit::Scanner) }

    before do
      allow(Bundler::Audit::Database).to receive(:update!)

      allow(scanner).to receive(:scan).and_yield(double("result", gem: "example_gem"))

      allow(Bundler::Audit::Scanner).to receive(:new).and_return(scanner)
    end

    it "updates the vulnerability database" do
      checker.verify
      expect(Bundler::Audit::Database).to have_received(:update!)
    end

    it "returns an array of dependencies with vulnerabilities" do
      dependencies = checker.verify
      expect(dependencies.size).to eq(1)
      expect(dependencies.first.name).to eq("example_gem")
    end
  end
end
