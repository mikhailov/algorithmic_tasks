class MinMaxElement
  
  def initialize(array)
    @array     = array
    @min, @max = array[0], array[0]
  end

  def process
    @array.each do |i|
      @min = i if i < @min
      @max = i if i > @max
    end
    [ @min, @max ]
  end
end


require 'minitest/autorun'

class MinMaxElementTest < Minitest::Unit::TestCase
  def test_process
    assert_equal [0,9], MinMaxElement.new((0..9).to_a).process
  end
end