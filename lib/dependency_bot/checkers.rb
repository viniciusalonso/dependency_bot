module DependencyBot
  class Checkers
    attr_reader :checkers

    def initialize
      @checkers = []
    end

    def add_checker(checker)
      @checkers << checker
    end

    def run
      @checkers.map do |checker|
        checker.verify
      end.flatten
    end
  end
end
