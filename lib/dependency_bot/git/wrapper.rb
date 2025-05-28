require 'git'

module DependencyBot
  module Git
    class Wrapper
      def self.run_and_commit(fixer)
        g = ::Git.open('.')
        g.branch(fixer.branch_name).checkout
        fixer.fix
        g.add('.')
        g.commit(fixer.commit_message)
      end
    end
  end
end
