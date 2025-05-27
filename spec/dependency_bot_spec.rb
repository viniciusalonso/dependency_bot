# frozen_string_literal: true

RSpec.describe DependencyBot do
  it "has a version number" do
    expect(DependencyBot::VERSION).not_to be nil
  end
end
