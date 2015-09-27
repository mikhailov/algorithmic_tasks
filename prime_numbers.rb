class PrimeNumbers

  def initialize(size)
    raise ArgumentError if size < 2

    @array = 1.step(size,2).to_a
    @array.shift
    @prime = [2]
  end

  def process
    @array.each do |i|
      @prime.push(i) if inner_loop(i)
    end
    @prime
  end

  private

  def inner_loop(e, is_prime = true)
    half = e / 2
    3.step(e-1, 2) do |k|
      break if k > half
      if e % k == 0
        is_prime = false
        break
      end
    end
    is_prime
  end

end


require 'minitest/autorun'

class PrimeNumbersTest < Minitest::Unit::TestCase

  def test_valid_1
    assert_equal [2], PrimeNumbers.new(2).process
  end

  def test_valid_2
    assert_equal [2, 3, 5, 7, 11], PrimeNumbers.new(11).process
  end

  def test_valid_3
    assert_equal [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47], PrimeNumbers.new(50).process
  end

  def test_valid_4
    assert_equal [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97], PrimeNumbers.new(100).process
  end

  def test_invalid_5
    assert_raises( ArgumentError ) { PrimeNumbers.new(1) }
  end

end