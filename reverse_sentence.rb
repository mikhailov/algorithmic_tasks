class ReverseSentence

  def initialize(string)
    @array, @array_reversed = string.split(" "), []
  end

  def process    
    while @array.length > 0
      @array_reversed << @array.pop
    end
    @array_reversed.join(" ")
  end

end


require 'minitest/autorun'

class ReverseSentenceTest < Minitest::Unit::TestCase
  def test_process
    assert_equal "dogs likes bob", ReverseSentence.new("bob likes dogs").process
  end
end