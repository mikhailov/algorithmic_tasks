class Converter
  def initialize(value)
    @value = value.split("")
    @dec   = (0..15).to_a.collect(&:to_s)
    @hex   = (0..9).to_a.collect(&:to_s) + ('A'..'F').to_a
    @total = []
  end

  def hex_to_dec
    (@value.size-1).downto(0).each_with_index do |e,i|
      @total << @dec[@hex.index(@value[e].to_s)].to_i * (16**i)
    end
    @total.inject{|sum,i| sum += i}.to_s
  end

end


require 'minitest/autorun'

class ConverterTest < Minitest::Unit::TestCase

  def test_valid_1
    assert_equal '249', Converter.new('F9').hex_to_dec
  end
  
  def test_valid_2
    assert_equal '112524', Converter.new('1B78C').hex_to_dec
  end
  
  def test_valid_3
    assert_equal '982343', Converter.new('EFD47').hex_to_dec
  end
  
  def test_valid_4
    assert_equal '3241', Converter.new('CA9').hex_to_dec
  end


end
