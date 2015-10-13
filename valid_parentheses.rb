class ValidParentheses
  SYMBOLS = {"(" => ")", "[" => "]", "{" => "}"}

  def initialize(array)
    @array = array.split("")
    @stack = []
  end

  def process
    @array.each do |i|
      if SYMBOLS.keys.include?(i)
        @stack.push(SYMBOLS[i])
      elsif SYMBOLS.values.include?(i)
        if @stack[-1] == i
          @stack.pop
        else
          return false
        end
      end
    end

    @stack.empty?
  end

end


require 'minitest/autorun'

class TestValidParentheses < Minitest::Unit::TestCase

  def test_valid_input_1
    assert_equal ValidParentheses.new("()").process, true
  end
  
  def test_valid_input_2
    assert_equal ValidParentheses.new("()[]{}").process, true
  end
  
  def test_valid_input_3
    assert_equal ValidParentheses.new("()([]){[()]}").process, true
  end
  
  def test_valid_input_4
    assert_equal ValidParentheses.new("[()[]{}]").process, true
  end
  
  def test_invalid_input_5
    assert_equal ValidParentheses.new("(]").process, false
  end
  
  def test_invalid_input_6
    assert_equal ValidParentheses.new("([)]").process, false
  end
  
  def test_invalid_input_7
    assert_equal ValidParentheses.new("()[)()]").process, false
  end

  def test_invalid_input_8
    assert_equal ValidParentheses.new("[()[]{}](").process, false
  end

  def test_invalid_input_9
    assert_equal ValidParentheses.new("[()[]{}]([[[").process, false
  end

end

