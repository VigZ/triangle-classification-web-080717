require "pry"
class Triangle
  attr_accessor :array_of_sides, :side_1, :side_2, :side_3

  def initialize(side_1,side_2,side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
    # hash_of_sides.each do |key, value|
    #   self.send("#{key}=", value)
  end

  def array_of_sides
    return [@side_1, @side_2, @side_3]
  end

  def triangle_theorem
    if @side_1 + @side_2 > @side_3 && @side_1 + @side_3 > @side_2 && @side_2 + @side_3 > @side_1
      return true
    else
      return false
    end
  end

  def triangle_check?
    if !self.array_of_sides.any?{|side| side <= 0}  && self.triangle_theorem
      return true
    else
      return false
    end
  end

  def kind
    if self.triangle_check?
      case self.array_of_sides.uniq.length
        when 3
          return :scalene
        when 2
          return :isosceles
        when 1
          return :equilateral
      end
    else
    raise TriangleError
    end
  end


end

class TriangleError < StandardError
  def message
  puts "That's not a triangle!"
  end
end
