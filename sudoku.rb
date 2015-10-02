class Sudoku

  def initialize(array)
    @array = array
  end
    
  def process




    [0,1,2].each do |k|
      [0,1,2].each do |j|
        print "#{@array[j][k]}  "
      end
      puts
    end

    puts
    
    [0,1,2].each do |k|
      [3,4,5].each do |j|
        print "#{@array[j][k]}  "
      end
      puts
    end

    puts
    
    [0,1,2].each do |k|
      [6,7,8].each do |j|
        print "#{@array[j][k]}  "
      end
      puts
    end

  end

end


require 'minitest/autorun'

class SudokuTest < Minitest::Unit::TestCase

  def test_valid_1
    Sudoku.new([
      [[0,3,4],[0,0,7],[1,8,6]], [[0,0,6],[8,1,0],[3,0,2]], [[0,0,7],[0,6,0],[4,5,0]],
      [[0,0,9],[6,0,0],[7,0,0]], [[6,8,0],[0,0,0],[0,9,5]], [[0,0,2],[0,0,4],[6,0,0]],
      [[0,9,2],[0,7,0],[8,0,0]], [[5,0,7],[0,3,8],[2,0,0]], [[1,4,8],[9,0,0],[3,7,0]]      
    ]).process
  end
end

