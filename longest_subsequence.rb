class LongestSubsequence
  def initialize(array)
    @array    = array
    @sequence = []
  end

  def process
    @array.each_with_index do |e,i|
      @sequence[i] = [e]

      (i+1...@array.size).each do |y|
        if @array[y] < @sequence[i][-1]
          break
        else
          @sequence[i] << @array[y]
        end

      end
    end

    @sequence.sort_by{|i| i.length}[-1]
  end

end


require 'minitest/autorun'

class LongestSubsequenceTest < Minitest::Unit::TestCase
  def test_process_1
    assert_equal [0,1,2,3], LongestSubsequence.new([0,1,2,3,0,1,2]).process
  end
end