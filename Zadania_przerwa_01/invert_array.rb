def invert_array(array)
  print array.map! {|el| el * (-1)}
  puts
end

invert_array([1, 2, 3, 4, 5])
invert_array([1, -2, 3, -4, 5])
invert_array([0])
