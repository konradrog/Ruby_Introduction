def suma(n)
  (1..n).sum do |el|
    if el % 2 == 0
      el * 1
    else
      el = 0
    end
  end
end

puts suma(gets.to_i)
