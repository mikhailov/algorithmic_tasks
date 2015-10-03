class Factorial

  def initialize(num)
    @num = num
  end

  def process
    recursion(@num)
  end

  def recursion(a)
    return 1 if [0,1].include?(a)
    recursion(a-1) * a
  end

end


require 'minitest/autorun'

class FactorialTest < Minitest::Unit::TestCase
  def test_process_1
    assert_equal 1, Factorial.new(0).process
  end

  def test_process_2
    assert_equal 1, Factorial.new(1).process
  end

  def test_process_3
    assert_equal 2, Factorial.new(2).process
  end

  def test_process_4
    assert_equal 6, Factorial.new(3).process
  end

  def test_process_5
    assert_equal 24, Factorial.new(4).process
  end

  def test_process_6
    assert_equal 120, Factorial.new(5).process
  end

  def test_process_7
    assert_equal 40320, Factorial.new(8).process
  end

  def test_process_8
    assert_equal 479001600, Factorial.new(12).process
  end
end
