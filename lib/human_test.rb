require "minitest/autorun"
require_relative "human"

class HumanTest < Minitest::Test
  def test_have_a_name
    human = Human.new("Hugh")
    assert human.name
    assert_equal human.name, "Hugh"
  end
end
