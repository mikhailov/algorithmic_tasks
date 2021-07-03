class SplitNumber
  def initialize(num)
    @num = num
  end

  def process
    if !validate
      raise ArgumentError
    end

    i = @num * 4 / 9
    y = @num - i

    [i, y]
  end

  def validate
    @num.instance_of?(Integer) && @num > 1
  end
end


require 'minitest/autorun'

class SplitNumberTest < Minitest::Test
  def test_invalid_1
    assert_equal false, SplitNumber.new("").validate
  end

  def test_invalid_2
    assert_equal false, SplitNumber.new(0).validate
  end

  def test_invalid_3
    assert_equal false, SplitNumber.new(1).validate
  end

  def test_valid_1
    assert_equal [5, 7], SplitNumber.new(12).process
  end

  def test_valid_2
    assert_equal [12, 16], SplitNumber.new(28).process
  end
end