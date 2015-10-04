class DocumentDistance
  def initialize(string1, string2)
    @string1, @string2 = string1, string2
  end

  def process
    vector1_len = Math.sqrt(inner_product(@string1, @string1))
    vector2_len = Math.sqrt(inner_product(@string2, @string2))
    angle       = inner_product(@string1, @string2) / (vector1_len * vector2_len)
    return Math.acos(angle)
  end

  private

  def inner_product(string1, string2)
    vector1, vector2 = Hash.new(0), Hash.new(0)
    string1.split(" ").each{ |i| vector1[i] += 1 }
    string2.split(" ").each{ |i| vector2[i] += 1 }

    sorted_vectors = [vector1, vector2].sort_by{|i| i.length}
    min, max       = sorted_vectors[0], sorted_vectors[1]
    mult_result    = 0

    min.each_key do |i|
      next if !max.include?(i) 
      mult_result += vector1[i] * vector2[i]
    end
    mult_result
  end

end


require 'minitest/autorun'

class DocumentDistanceTest < Minitest::Unit::TestCase
  def test_process_1
    assert_equal 0.0, DocumentDistance.new("fish dog dog cat cat dog fish", "fish fish dog dog cat cat dog").process
  end

  def test_process_2
    assert_equal 0.3089247840430206, DocumentDistance.new("fish dog dog cat cat dog dog", "fish dog dog cat cat fish dog").process
  end

  def test_process_3
    assert_equal 0.3137278864615957, DocumentDistance.new("fish dog dog cat cat cat cat", "cat dog dog cat cat fish dog").process
  end

  def test_process_4
    assert_equal 0.33347317225183215, DocumentDistance.new("fish dog dog fish", "fish dog dog cat fish dog").process
  end

  def test_process_5
    assert_equal 0.439597814616353, DocumentDistance.new("fish dog dog cat cat dog fish fish fish fish", "fish dog dog cat cat fish dog").process
  end

  def test_process_6
    assert_equal 0.7086262721276703, DocumentDistance.new("fish dog dog cat cat dog fish", "fish fish dog").process
  end

  def test_process_7
    assert_equal 1.0305532099636001, DocumentDistance.new("fish dog dog cat dog fish", "cat cat cat cat cat fish dog").process
  end

  def test_process_8
    assert_equal 1.5707963267948966, DocumentDistance.new("fish dog dog", "cat cat cat cat cat").process
  end

  def test_process_9
    assert_equal 1.5707963267948966, DocumentDistance.new("fish dog dog", "cat cat cat cat cat cat cat cat cat").process
  end

end
