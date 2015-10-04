class MatrixRotate
  def initialize(matrix)
    @matrix = matrix
    @matrix2 = []
  end

  def process    
    width  = @matrix[0].size
    height = @matrix.size

    (0...width).each do |i|
      (height-1).downto(0).each do |k|
        @matrix2[i] ||= []
        @matrix2[i] << @matrix[k][i]
      end
    end

    return @matrix2
  end
end


require 'minitest/autorun'

class MatrixRotateTest < Minitest::Unit::TestCase
  def test_process_1
    assert_equal [[3,7,4],[9,0,6],[2,8,1]], MatrixRotate.new([[4,6,1],[7,0,8],[3,9,2]]).process
  end

  def test_process_2
    assert_equal [[2,1],[3,4],[4,7],[5,8],[9,6]], MatrixRotate.new([[1,4,7,8,6],[2,3,4,5,9]]).process
  end

end