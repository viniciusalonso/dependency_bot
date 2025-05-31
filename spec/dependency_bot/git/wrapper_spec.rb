# frozen_string_literal: true

require "git"

RSpec.describe DependencyBot::Git::Wrapper do
  describe ".run_and_commit" do
    let(:fixer) { double("fixer", branch_name: "test-branch", commit_message: "Test commit message") }
    let(:git_instance) { instance_double(::Git::Base) }

    before do
      allow(::Git).to receive(:open).with(".").and_return(git_instance)
      allow(git_instance).to receive(:branch).with("test-branch").and_return(git_instance)
      allow(git_instance).to receive(:checkout)
      allow(git_instance).to receive(:add).with(".")
      allow(git_instance).to receive(:commit).with("Test commit message")
      allow(git_instance).to receive(:push)
      allow(git_instance).to receive(:branch).with("-")
      allow(fixer).to receive(:fix)
    end

    it "checks out the specified branch" do
      described_class.run_and_commit(fixer)
      expect(git_instance).to have_received(:checkout)
    end

    it "calls the fix method on the fixer" do
      described_class.run_and_commit(fixer)
      expect(fixer).to have_received(:fix)
    end

    it "adds changes to git" do
      described_class.run_and_commit(fixer)
      expect(git_instance).to have_received(:add).with(".")
    end

    it "commits the changes with the correct message" do
      described_class.run_and_commit(fixer)
      expect(git_instance).to have_received(:commit).with("Test commit message")
    end

    it "pushes the changes" do
      described_class.run_and_commit(fixer)
      expect(git_instance).to have_received(:push)
    end

    it "back to the previous branch" do
      described_class.run_and_commit(fixer)
      expect(git_instance).to have_received(:branch).with("-")
    end
  end
end
