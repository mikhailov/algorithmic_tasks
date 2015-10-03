class FibonacciMemoizedRecursion
  def initialize(num)
    @num = num
    @memo = {0 => 0, 1 => 1, 2 => 1}
  end

  def process
    recursion(@num)
  end

  private

  def recursion(a)
    return @memo[a] if @memo.include?(a)
    @memo[a] = recursion(a-1) + recursion(a-2)
  end

end


require 'minitest/autorun'

class FibonacciMemoizedRecursionTest < Minitest::Unit::TestCase
  def test_process_1
    assert_equal 0, FibonacciMemoizedRecursion.new(0).process
  end
  
  def test_process_2
    assert_equal 1, FibonacciMemoizedRecursion.new(1).process
  end

  def test_process_3
    assert_equal 1, FibonacciMemoizedRecursion.new(2).process
  end

  def test_process_4
    assert_equal 2, FibonacciMemoizedRecursion.new(3).process
  end

  def test_process_5
    assert_equal 3, FibonacciMemoizedRecursion.new(4).process
  end

  def test_process_6
    assert_equal 5, FibonacciMemoizedRecursion.new(5).process
  end

  def test_process_7
    assert_equal 8, FibonacciMemoizedRecursion.new(6).process
  end

  def test_process_8
    assert_equal 13, FibonacciMemoizedRecursion.new(7).process
  end
end