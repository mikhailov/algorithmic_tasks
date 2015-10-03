class BinarySearch
  def initialize(array)
    @array = array
    @min   = 0
    @max   = @array.size-1
  end

  def process(value)
    mid = @array[(@max+@min)/2]

    if value == mid
      true
    elsif mid == @max || mid == @min
      false
    elsif value > mid
      @min = mid
      process(value)
    elsif value < mid
      @max = mid
      process(value)
    else
      false
    end
  end
end


require 'minitest/autorun'

class BinarySearchTest < Minitest::Unit::TestCase

  def test_valid_1
    assert_equal true, BinarySearch.new([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]).process(2)
  end

  def test_valid_2
    assert_equal true, BinarySearch.new([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]).process(2)
  end

  def test_valid_3
    assert_equal true, BinarySearch.new([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]).process(10)
  end

  def test_valid_4
    assert_equal true, BinarySearch.new([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]).process(13)
  end

  def test_valid_5
    assert_equal true, BinarySearch.new([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]).process(14)
  end

  def test_valid_6
    assert_equal false, BinarySearch.new([0,2,3,4,5,6,7,8,9,10,11,12,13,14,15]).process(1)
  end

  def test_valid_7
    assert_equal false, BinarySearch.new([0,2,3,4,5,6,7,8,9,10,11,12,13,15]).process(14)
  end

end

