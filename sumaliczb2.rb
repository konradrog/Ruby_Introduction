def suma(n)
  sum = 0
  (0..n).step(2) do |el|
    sum += el
  end
  sum
end

puts suma(9)
