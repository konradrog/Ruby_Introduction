def euklides(first, second)
  x = first
  y = second
  result = x - y
  while result != 0
    result = x - y
    if result > y
      x = result
    else
      x = y
      y = result
    end
  end
  x
end


puts euklides(ARGV[0].to_i, ARGV[1].to_i)
