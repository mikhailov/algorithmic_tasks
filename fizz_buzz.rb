class FizzBuzz
  def initialize(array)
    @array     = array
    @new_array = []
  end

  def process
    @array.each do |e|
      value = \
      if e % 3 == 0 && e % 5 == 0
        'FizzBuzz'
      elsif e % 3 == 0
        'Fizz'
      elsif e % 5 == 0
        'Buzz'
      else
        e
      end
      @new_array.push(value)
    end

    return @new_array
  end

end


require 'minitest/autorun'

class FizzBuzzTest < Minitest::Unit::TestCase
  def test_process
    assert_equal [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz"], FizzBuzz.new((1..15).to_a).process
  end
end