# frozen_string_literal: true

require "git"

module DependencyBot
  module Git
    # This class is a wrapper around the Git gem to handle git operations.
    # It checks out a branch, applies fixes, adds changes, and commits them.
    # The class is used by DependencyBot to manage dependency updates in a repository.
    # It is not intended to be used directly outside of the DependencyBot context.
    # The class assumes that the current working directory is a valid git repository.
    class Wrapper
      def self.run_and_commit(fixer)
        g = ::Git.open(".")
        g.branch(fixer.branch_name).checkout
        fixer.fix
        g.add(".")
        g.commit(fixer.commit_message)
      end
    end
  end
end
