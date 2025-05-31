# frozen_string_literal: true

require "gitlab"

module DependencyBot
  module Gitlab
    # This class is responsible for creating a merge request in GitLab
    # using the GitLab API. It uses the `gitlab` gem to interact with the GitLab API.
    # The merge request is created from a branch that has been updated to fix security vulnerabilities.
    # The project ID and target branch are fetched from environment variables.
    class MergeRequestCreator
      def self.create(fixer)
        project_id = ENV.fetch("GITLAB_PROJECT_ID", nil)
        target_branch = ENV.fetch("GITLAB_MAIN_BRANCH", nil)

        ::Gitlab.create_merge_request(
          project_id,
          fixer.commit_message,
          source_branch: fixer.branch_name,
          target_branch: target_branch,
          description: "Update dependency to fix security vulnerabilities"
        )
      end
    end
  end
end
