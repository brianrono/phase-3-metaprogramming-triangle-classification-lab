class Triangle
  # write code here
  attr_reader :side1, :side2, :side3
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate_triangle
    if @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side1 == @side2 || @side2 == @side3 || @side3 == @side1
      :isosceles
    else
      :scalene
    end
  end
  
  private

  def validate_triangle
    validate_positive_sides
    validate_non_zero_sides
    validate_triangle_inequality
  end

  def validate_positive_sides
    if @side1 <= 0 || @side2 <= 0 || @side3 <= 0
      raise TriangleError, "Sides of a triangle must be positive"
    end
  end

  def validate_triangle
    if @side1 + @side2 <= @side3 || @side2 + @side3 <= @side1 || @side1 + @side3 <= @side2
      raise TriangleError, "Invalid triangle: violates triangle inequality"
    end
  end
    class TriangleError < StandardError
  end
end