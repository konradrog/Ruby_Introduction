def invert_array(array)
  array.map {|el| el * (-1)}
end

print invert_array([1, 2, 3, 4, 5])
puts
print invert_array([1, -2, 3, -4, 5])
puts
print invert_array([0])
puts
