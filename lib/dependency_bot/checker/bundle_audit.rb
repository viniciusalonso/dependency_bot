# frozen_string_literal: true

require "bundler/audit/scanner"
require "bundler/audit/database"

module DependencyBot
  module Checker
    # This class is responsible for checking the Gemfile.lock for vulnerabilities
    # using the Bundler::Audit gem.
    # It updates the vulnerability database and scans the Gemfile.lock for known vulnerabilities.
    # It returns an array of DependencyBot::DependencyGem objects for each vulnerable gem found.
    # # Usage:
    # ```ruby
    # checker = DependencyBot::Checker::BundleAudit.new
    # vulnerable_gems = checker.verify
    # # vulnerable_gems.each do |gem|
    # #   puts "Vulnerable gem: #{gem.name}"
    # # end
    # ```
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
