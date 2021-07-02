class FizzBuzz
  def initialize(array)
    @array     = array
    @new_array = []
  end

  def process
    @array.each do |i|
      if i % 3 == 0 && i % 5 == 0
        @new_array << 'FizzBuzz'
      elsif i % 5 == 0
        @new_array << 'Buzz'
      elsif i % 3 == 0
        @new_array << 'Fizz'
      else
        @new_array << i
      end
    end

    @new_array
  end

end


require 'minitest/autorun'

class FizzBuzzTest < Minitest::Unit::TestCase
  def test_process_1
    assert_equal [1, 2, "Fizz", 4, "Buzz"], FizzBuzz.new((1..5).to_a).process
  end

  def test_process_2
    assert_equal [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz"], FizzBuzz.new((1..15).to_a).process
  end
end