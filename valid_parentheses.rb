class ValidParentheses
  SYMBOLS = {"(" => ")", "[" => "]", "{" => "}"}

  def initialize(array)
    @array = array.split("")
    @stack = []
  end

  def process
    open_parentheses = SYMBOLS.keys
    closed_parentheses = SYMBOLS.values

    @array.each do |i|
      if open_parentheses.include?(i)
        @stack.push(SYMBOLS[i])
      elsif closed_parentheses.include?(i)
        if i == @stack[-1]
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

