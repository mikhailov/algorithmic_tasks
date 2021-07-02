class HumanNumber
  def initialize(str)
    @str = str
  end

  def process
    if @str.length < 4
      @str
    else
      elements = @str.split("")
      new_elements, idx = [], 0

      while(true) do
        new_elements.unshift(elements.pop)
        break if elements.length == 0

        idx += 1
        if idx % 3 == 0 &&
          new_elements.unshift(",")
        end
      end

      new_elements.join("")
    end
  end
end


require 'minitest/autorun'

class HumanNumberTest < Minitest::Test
  def test_process_1
    assert_equal "", HumanNumber.new("").process
  end

  def test_process_2
    assert_equal "351", HumanNumber.new("351").process
  end

  def test_process_3
    assert_equal "3,512", HumanNumber.new("3512").process
  end

  def test_process_4
    assert_equal "35,128", HumanNumber.new("35128").process
  end

  def test_process_5
    assert_equal "351,212", HumanNumber.new("351212").process
  end

  def test_process_6
    assert_equal "1,234,351", HumanNumber.new("1234351").process
  end

  def test_process_7
    assert_equal "12,343,519", HumanNumber.new("12343519").process
  end

  def test_process_8
    assert_equal "123,435,190", HumanNumber.new("123435190").process
  end

  def test_process_9
    assert_equal "1,234,351,902", HumanNumber.new("1234351902").process
  end
end
