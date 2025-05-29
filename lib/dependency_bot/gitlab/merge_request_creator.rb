require 'gitlab'

module DependencyBot
  module Gitlab
    class MergeRequestCreator
      def self.create(fixer)
        project_id = ENV.fetch('GITLAB_PROJECT_ID', nil)
        target_branch = ENV.fetch('GITLAB_MAIN_BRANCH', nil)

        ::Gitlab.create_merge_request(
          project_id,
          fixer.commit_message,
          source_branch: fixer.branch_name,
          target_branch: target_branch,
          description: 'Update dependency to fix security vulnerabilities'
        )
      end
    end
  end
end
