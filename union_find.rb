class UF
  attr_reader :array

  def initialize(array)
    @array = array
  end
  
  def union(p,q)
    return if p == q

    pb = lookup(p)
    qb = lookup(q)

    if pb != qb
      @array = resulted_array(pb,qb)
    end
  end

  def connected(p,q)
    return true if p == q
    lookup(p) == lookup(q)    
  end


  private

  def lookup(o)
    @array.find{|i| i.include?(o)}
  end

  def resulted_array(pb,qb)
    new_array = [pb + qb]
    @array.each do |i|
      next if i == pb || i == qb
      new_array << i
    end
    new_array
  end
end


require 'minitest/autorun'

class TestUF < Minitest::Unit::TestCase

  def setup
    @object = UF.new([ [0,1], [2,3,4,5], [6,7,8,9] ])
  end

  def test_init_connectivity
    assert_equal @object.connected(0,1), true
    assert_equal @object.connected(1,1), true
    assert_equal @object.connected(0,2), false
    assert_equal @object.connected(0,6), false
  end

  def test_union_find
    assert_equal @object.connected(0,2), false
    @object.union(0,0)
    @object.union(0,2)
    assert_equal @object.connected(0,2), true
    assert_equal @object.connected(5,9), false
    assert_equal @object.connected(0,7), false
    @object.union(0,6)
    assert_equal @object.connected(0,7), true
    assert_equal @object.connected(5,9), true
  end

end
