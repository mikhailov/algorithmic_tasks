class QU
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def union(p,q)
    return if p == q
    @array[root(p)] = root(q)
  end

  def connected(p,q)
    return true if p == q
    root(p) == root(q)
  end

  # @array[i] if parent of index
  def root(i)
    if i != @array[i]
      root(@array[i])
    else
      @array[i]
    end
  end

  def count
    sum = 0
    @array.each_with_index{ |e,i| sum += 1 if (e == i) }
    sum
  end

end


require 'minitest/autorun'

class TestQU < Minitest::Unit::TestCase

  def setup
    @object = QU.new([ 0,1,9,4,9,6,6,7,8,9 ])
  end

  def test_root
    assert_equal @object.root(2), 9
    assert_equal @object.root(3), 9
    assert_equal @object.root(5), 6
    assert_equal @object.root(0), 0
  end

  def test_quick_union
    assert_equal @object.connected(0,0), true
    assert_equal @object.connected(0,1), false
    assert_equal @object.count, 6
    assert_equal @object.connected(2,6), false
    @object.union(3,5)
    assert_equal @object.count, 5
    assert_equal @object.connected(2,6), true
  end
end