# frozen_string_literal: true

require_relative "dependency_bot/version"
require 'dependency_bot/checkers'
require 'dependency_bot/checker/bundle_audit'
require 'dependency_bot/fixer/bundle_audit'
require 'dependency_bot/git/wrapper'
require 'dependency_bot/dependency_gem'

module DependencyBot
  class Error < StandardError; end
  # Your code goes here...
end
