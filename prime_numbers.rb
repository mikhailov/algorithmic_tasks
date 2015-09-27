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
    third = e / 3
    3.step(e-1, 2) do |k|
      break if k > third
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

  def test_valid_5
    assert_equal [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797], PrimeNumbers.new(800).process
  end

  def test_invalid_6
    assert_raises( ArgumentError ) { PrimeNumbers.new(1) }
  end

end
