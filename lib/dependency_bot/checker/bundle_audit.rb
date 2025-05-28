require 'bundler/audit/scanner'
require 'bundler/audit/database'

module DependencyBot
  module Checker
    class BundleAudit
      def initialize
        @dependencies = []
      end

      def verify
        # Update the vulnerability database
        Bundler::Audit::Database.update!

        # Scan the Gemfile.lock for vulnerabilities
        scanner = Bundler::Audit::Scanner.new

        scanner.scan do |result|
          @dependencies << DependencyBot::DependencyGem.new(name: result.gem)
        end

        @dependencies
      end
    end
  end
end
