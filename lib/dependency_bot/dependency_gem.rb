# frozen_string_literal: true

module DependencyBot
  # This class represents a dependency gem.
  # It is initialized with a name and provides access to that name.
  # It can be extended in the future to include more functionality related to dependency management.
  class DependencyGem
    attr_reader :name

    def initialize(name:)
      @name = name
    end
  end
end
