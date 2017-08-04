puts
print " " * 5
(1..10).each do |el|
  print "%-5d" % el
end
puts
print " " * 5
10.times { print "---- "}
puts
i = 1
while i < 11
  print "%-3d" % i, "| "
  (1..10).each do |el|
    j = el*i
    print "%-5d" % j
  end
  puts
  i += 1
end
