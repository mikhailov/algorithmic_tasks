class Sqrt
  def initialize(num)
    @num = num
  end

  def process
    if !validate
      raise ArgumentError
    end

    result = 1.0

    10.times do |i|
      result -= (result * result - @num) / (2 * result)
    end

    result
  end

  def validate
    @num.instance_of?(Integer) && @num > 0
  end
end

require 'minitest/autorun'

class SqrtTest < Minitest::Test
  def test_invalid_1
    assert_equal false, Sqrt.new("").validate
  end

  def test_invalid_2
    assert_equal false, Sqrt.new(0).validate
  end

  def test_invalid_3
    assert_equal true, Sqrt.new(1).validate
  end

  def test_valid_1
    assert_equal 1.414213562373095, Sqrt.new(2).process
  end

  def test_valid_2
    assert_equal 3, Sqrt.new(9).process
  end
end