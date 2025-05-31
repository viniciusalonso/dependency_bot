# frozen_string_literal: true

require "gitlab"

RSpec.describe DependencyBot::Gitlab::MergeRequestCreator do
  describe ".create" do
    let(:fixer) do
      instance_double("DependencyBot::Fixer::BundleAudit", commit_message: "Fix security vulnerability",
                                                           branch_name: "fix/security-vulnerability")
    end
    let(:project_id) { "12345" }
    let(:target_branch) { "main" }

    before do
      ::Gitlab.configure do |config|
        config.endpoint       = "https://gitlab.com/api/v4"
        config.private_token  = "FAKE_TOKEN_FOR_TESTS"
      end

      allow(ENV).to receive(:fetch).with("GITLAB_PROJECT_ID", nil).and_return(project_id)
      allow(ENV).to receive(:fetch).with("GITLAB_MAIN_BRANCH", nil).and_return(target_branch)
      allow(Gitlab).to receive(:create_merge_request)
    end

    it "creates a merge request with the correct parameters" do
      allow(::Gitlab).to receive(:create_merge_request)

      described_class.create(fixer)

      expect(::Gitlab).to have_received(:create_merge_request).with(
        project_id,
        fixer.commit_message,
        source_branch: fixer.branch_name,
        target_branch: target_branch,
        description: "Update dependency to fix security vulnerabilities"
      )
    end
  end
end
