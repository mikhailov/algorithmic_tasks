class Remainder

  def initialize(num, den)
    @num, @den = num, den
    raise ArgumentError if den < 1
  end

  def process
    return 0    if @den == 1 || @den == @num
    return @num if @den > @num
    @num - (@num / @den * @den)
  end

end


require 'minitest/autorun'

class RemainderTest < Minitest::Unit::TestCase

  def test_valid_1
    assert_equal 2, Remainder.new(5,3).process
  end

  def test_valid_2
    assert_equal 1, Remainder.new(10,3).process
  end

  def test_valid_3
    assert_equal 0, Remainder.new(11,1).process
  end

  def test_valid_4
    assert_equal 2, Remainder.new(11,3).process
  end

  def test_valid_5
    assert_equal 7, Remainder.new(7,10).process
  end

  def test_valid_6
    assert_equal 0, Remainder.new(67,67).process
  end

  def test_valid_7
    assert_equal 0, Remainder.new(128,2).process
  end

  def test_valid_8
    assert_equal 7, Remainder.new(128,11).process
  end

  def test_invalid_9
    assert_raises( ArgumentError ) { Remainder.new(11,0).process } 
  end



end