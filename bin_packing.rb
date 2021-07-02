class BinPacking
  def initialize(weights, algorithm)
    @weights = weights
    @algorithm = algorithm
    @bins = [
      { left: 20, weights: [] },
      { left: 20, weights: [] },
      { left: 20, weights: [] },
      { left: 20, weights: [] }
    ]
    @result = []
  end

  def process
    if !@weights.is_a?(Array)
      raise ArgumentError
    elsif !['first-fit', 'best-fit'].include?(@algorithm)
      raise ArgumentError
    end

    @weights.each do |i|
      bins_loop(i, @algorithm)
    end

    @bins.each do |i|
      @result << i[:weights]
    end
    @result
  end

  private

  def bins_loop(i, algorithm)
    case algorithm
    when 'first-fit'
      @bins.each do |j|
        if j[:left] >= i
          j[:weights] << i
          j[:left] -= i
          return
        end
      end
    when 'best-fit'
      @bins.each do |j|
        j[:would_have_left] = j[:left] - i
      end

      @bins.sort_by {|i| i[:would_have_left]}.each do |j|
        if j[:left] >= i
          j[:weights] << i
          j[:left] -= i
          return
        end
      end
    end
  end
end


require 'minitest/autorun'
class BinPackingTest < Minitest::Test
  def test_boundaries_1
    assert_raises("ArgumentError") do
      BinPacking.new('', 'first-fit').process
    end
  end

  def test_boundaries_2
    assert_raises("ArgumentError") do
      BinPacking.new([1,2], '').process
    end
  end

  def test_first_fit_valid
    assert_equal BinPacking.new([11, 2, 15, 5, 6, 17, 7], 'first-fit').process, [[11, 2, 5], [15], [6, 7], [17]]
  end

  def test_best_fit
    assert_equal BinPacking.new([11, 2, 15, 5, 6, 17, 7], 'best-fit').process, [[11, 2, 6], [15, 5], [17], [7]]
  end
end