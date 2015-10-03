class Division
  def initialize(dividend, divisor)
    @dividend, @divisor = dividend, divisor
  end

  def process
    result, num = @divisor, 0
    while result <= @dividend
      result, num = result + @divisor, num + 1
    end
    num
  end
  
end


require 'minitest/autorun'

class DivisionTest < Minitest::Unit::TestCase
  def test_process_1
    assert_equal 1, Division.new(11,11).process
  end

  def test_process_2
    assert_equal 7, Division.new(35,5).process
  end

  def test_process_3
    assert_equal 7, Division.new(35,5).process
  end
end