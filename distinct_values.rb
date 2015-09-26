class DistinctValues
  def initialize(array)
    @array      = array
    @occurrence = Hash.new(0)
  end

  def process
    @array.each do |i|
      @occurrence[i] += 1
    end
    @occurrence.keys
  end
end


require 'minitest/autorun'

class DistinctValuesTest < Minitest::Unit::TestCase
  def test_process_1
    assert_equal [1], DistinctValues.new([1,1,1]).process
  end

  def test_process_2
    assert_equal [1,2,3], DistinctValues.new([1,2,3]).process
  end

  def test_process_3
    assert_equal [1,2,3,4,5], DistinctValues.new([1,1,2,2,2,2,2,3,4,5,1,2]).process
  end

  def test_process_4
    assert_equal [9,1], DistinctValues.new([9,1,1]).process
  end
end