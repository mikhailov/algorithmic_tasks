class ReverseString

  def initialize(array)
    @array = array
    @size  = @array.size
  end

  def process
    (0...@size/2).to_a.each_with_index do |e,i|
      @array[i], @array[@size-i-1] = @array[@size-i-1], @array[i]
    end
    @array
  end

end


require 'minitest/autorun'

class ReverseStringTest < Minitest::Unit::TestCase
  def test_process
    array = (0...1000000).to_a
    assert_equal array.reverse, ReverseString.new(array).process
  end
end
