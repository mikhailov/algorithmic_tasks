class DecimalMark

  def initialize(data)
    @array     = data.split("")
    @new_array = []
  end

  def process
    i = 0
    loop do
      i += 1
      @new_array << @array.pop
      break if @array.empty?
      @new_array << ',' if (i % 3 == 0)
    end

    @new_array.reverse.join('')
  end

end


require 'minitest/autorun'

class TestDecimalMark < Minitest::Unit::TestCase

  def test_valid_input_1
    assert_equal "123,232", DecimalMark.new("123232").process
  end
  
  def test_valid_input_2
    assert_equal "1,024", DecimalMark.new("1024").process
  end
  
  def test_valid_input_3
    assert_equal "1,474,560", DecimalMark.new("1474560").process
  end
  
  def test_valid_input_4
    assert_equal "1,073,741,824", DecimalMark.new("1073741824").process
  end

  def test_invalid_input_5
    assert_equal "", DecimalMark.new("").process
  end

end

