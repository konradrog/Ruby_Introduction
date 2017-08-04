def empty(n)
  print " " * n
end

def star(n)
  print "*" * n
end

def ch_tree(level, width)
  k = 0
  l = level
  m = 1
  while m <= level
    i = width/2+1 #liczba poziomów w jednym segmencie, ilość liczb nieparzystych
    j = 1 #ilość gwiazdek na jednym poziomie
    while i + m-1 > 0
      empty(i+2*l+m)
      star(j+k)
      puts
      i -= 1
      j += 2
    end
    k += 2 #szerokość  wierzchołka w zależnosci od liczby segmentów
    l -= 1 #ilość pustych miejsc na jednym poziomie
    m += 1 #ilość segmentów
  end
  empty(width/2+2+2*level)
  star(1)
  puts
end

puts "Define (insert 2 parameters) number of levels,\
 witdh of the first level(odd number)"

ch_tree(gets.to_i,gets.to_i)
