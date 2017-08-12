class Figure
  def present_result
    puts "Results for your #{self.class} are #{area} m^2 and #{perimieter} m"
  end

  def self.present_result(*param)
    figure = self.new(*param)
    figure.present_result
  end

  def area
    raise "implemnet this method in subclass"
  end
end


class Circle < Figure
  def initialize(radius)
    @radius = radius
  end

  def area
    2 * Math::PI * (@radius ** 2)
  end

  def perimieter
    2 * Math::PI * @radius
  end
end

class Square < Figure
  def initialize(basis)
    @basis = basis
  end

  def area
    @basis * @basis
  end

  def perimieter
    4 * @basis
  end
end

class Rectangle < Figure
  def initialize(basis, side)
    @basis = basis
    @side = side
  end

  def area
    @basis * @side
  end

  def perimieter
    2 * @basis + 2 * @side
  end
end

class Trapezium < Figure
  def initialize(basis_down, basis_top, hight)
    @basis_down = basis_down
    @basis_top = basis_top
    @hight = hight
  end

  def area
    (@basis_top + @basis_down / 2) * @hight
  end

  def perimieter
    side = (@basis_top - @basis_down).abs
    side = Math::sqrt(side ** 2 + @hight ** 2)
    @basis_down + @basis_top + @hight + side
  end
end

Circle.present_result(0.05)
Circle.present_result(0.0225)
Circle.present_result(100)
Circle.present_result(1330)
puts
Rectangle.present_result(0.05, 0.02)
Rectangle.present_result(0.0333, 0.0420)
Rectangle.present_result(124, 33)
Rectangle.present_result(1200, 2200)
puts
Square.present_result(0.03)
Square.present_result(0.0445)
Square.present_result(12)
Square.present_result(3660)
puts
Trapezium.present_result(0.0234, 0.0666, 0.02)
Trapezium.present_result(113, 33, 16)
puts
