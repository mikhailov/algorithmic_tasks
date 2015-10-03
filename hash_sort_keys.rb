class HashSortKeys
  def initialize(hash)
    @hash = hash
  end

  def process
    @hash.keys.collect(&:to_s).sort_by{|i| i.length}
  end
end


require 'minitest/autorun'

class HashSortKeysTest < Minitest::Unit::TestCase
  def test_process_1
    assert_equal ["abc", "4567", "another_key"], HashSortKeys.new({ abc: 'hello', 'another_key' => 123, 4567 => 'third' }).process
  end
end
