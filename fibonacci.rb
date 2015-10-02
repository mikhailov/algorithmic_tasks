class Fibonacci
  def initialize(num)
    @num = num
    @array = [0,1]
  end

  def process
    return @num if [0,1].include?(@num)
    2.upto(@num).each do |i|
      @array[i] = @array[i-1] + @array[i-2]
    end
    @array[@num]
  end


end


require 'minitest/autorun'

class FibonacciTest < Minitest::Unit::TestCase
  def test_process_1
    assert_equal 0, Fibonacci.new(0).process
  end
  
  def test_process_2
    assert_equal 1, Fibonacci.new(1).process
  end

  def test_process_3
    assert_equal 1, Fibonacci.new(2).process
  end

  def test_process_4
    assert_equal 2, Fibonacci.new(3).process
  end

  def test_process_5
    assert_equal 3, Fibonacci.new(4).process
  end

  def test_process_6
    assert_equal 5, Fibonacci.new(5).process
  end

  def test_process_7
    assert_equal 8, Fibonacci.new(6).process
  end

  def test_process_8
    assert_equal 13, Fibonacci.new(7).process
  end
end