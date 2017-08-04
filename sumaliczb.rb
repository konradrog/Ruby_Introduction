def suma(n)
  sum = 0
  (1..n).each do |el|
    if el % 2 == 0
      sum += el
    end
  end
  sum
end

puts suma(gets.to_i)
