class ReverseString

  def initialize(string)
    @array, @array_reversed = string.split(""), []
  end

  def process    
    @array_reversed << @array.pop while @array.any?
    @array_reversed.join("")
  end

end


require 'minitest/autorun'

class ReverseStringTest < Minitest::Unit::TestCase
  def test_process
    assert_equal "9876543210", ReverseString.new("0123456789").process
  end
end