# frozen_string_literal: true

module DependencyBot
  module Fixer
    # This class is responsible for updating a Ruby dependency
    # using the `bundle update` command to fix security vulnerabilities.
    # It is part of the DependencyBot::Fixer module.
    #
    # Usage:
    #   fixer = DependencyBot::Fixer::BundleAudit.new(dependency)
    #   fixer.fix
    #   puts fixer.branch_name
    #   puts fixer.commit_message
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
