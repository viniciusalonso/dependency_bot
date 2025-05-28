module DependencyBot
  class DependencyGem
    attr_reader :name

    def initialize(name:)
      @name = name
    end
  end
end
