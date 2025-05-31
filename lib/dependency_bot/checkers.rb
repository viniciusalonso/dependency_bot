# frozen_string_literal: true

module DependencyBot
  # This class is responsible for managing a collection of checkers
  # that verify various aspects of the DependencyBot's configuration and functionality.
  # It allows adding new checkers and running all of them to get a list of issues found.
  # # Each checker should implement a `verify` method that returns an array of issues found.
  # # Example usage:
  #  checkers = DependencyBot::Checkers.new
  #  checkers.add_checker(SomeChecker.new)
  #  issues = checkers.run
  class Checkers
    attr_reader :checkers

    def initialize
      @checkers = []
    end

    def add_checker(checker)
      @checkers << checker
    end

    def run
      @checkers.map(&:verify).flatten
    end
  end
end
