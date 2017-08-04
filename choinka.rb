def empty(n)
  print " " * n
end

def star(n)
  print "*" * n
end

def odd_counter(n)
  counter = 0
  (1..n).each do |el|
    if el.odd?
      counter += 1
    end
  end
  counter
end

# def ch_tree(n) # funkcja dla jednego poziomu/segmentu
#   i = odd_counter(n)
#   j = 1
#   while i > 0
#     empty(i)
#     star(j)
#     empty(i)
#     puts
#     i -= 1
#     j += 2
#   end
# end

def ch_tree(level,width)
  i = odd_counter(width)
  k = 0
  l = level
  while k <= level
    i = odd_counter(width)
    j = 1
    while i > 0
      empty(i+l)
      star(j+k)
      empty(i+l)
      puts
      i -= 1
      j += 2
    end
    k += 2
    l -= 1
  end
  empty(width/2 + 1)
  star(1)
  puts
end

puts "Define (insert 2 parameters) number of levels, witdh of first level"

ch_tree(1,9)
