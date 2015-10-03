class BinarySearch
  def initialize(array)
    @array = array
  end

  def process(value)
    min, max = 0, @array.size - 1

    while max >= min
      mid = (max + min) / 2
      if @array[mid] == value
        return true
      elsif @array[mid] < value
        min = mid + 1
      elsif @array[mid] > value
        max = mid - 1
      end
    end
    false
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

