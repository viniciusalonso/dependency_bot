module DependencyBot
  module Fixer
    class BundleAudit
      def initialize(dependency)
        @dependency = dependency
      end

      def fix
        Kernel.exec "bundle update #{@dependency.name}"
      end

      def branch_name
        "update-#{@dependency.name.downcase}"
      end

      def commit_message
        "Update #{@dependency.name} to fix security vulnerabilities"
      end
    end
  end
end
