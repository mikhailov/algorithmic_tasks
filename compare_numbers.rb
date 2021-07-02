class CompareNumbers
  def initialize(first, second)
    @first = first
    @second = second
  end

  def equal
    @first ^ @second == 0
  end
end

require 'minitest/autorun'

class CompareNumbersTest < Minitest::Unit::TestCase
  def test_scenario_1
    assert_equal true, CompareNumbers.new(1,1).equal
  end

  def test_scenario_2
    assert_equal false, CompareNumbers.new(1,3).equal
  end

  def test_scenario_3
    assert_equal false, CompareNumbers.new(100, 101).equal
  end
end
