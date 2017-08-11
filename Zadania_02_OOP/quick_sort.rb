input = [7, 2, 4, 7, 3, 1, 4, 6, 5, 8, 3, 9, 2, 6, 7, 6, 3]
input2 = [74, 77, 64, 19, 43, 47, 77, 66, 47, 60, 7, 97, 71, 87, 95, 79]


piwot = input[input.size / 2]
temp = input
print temp

temp[temp.size / 2], temp[temp.size - 1] = temp[temp.size - 1], temp[temp.size / 2]


puts piwot
print temp
puts

l = 0
i = 1
j = 0
while l < (temp.size - 2)
  if  temp.at(i) < piwot
    temp[j], temp[i] = temp[i], temp[j]
    i += 1
    j += 1
  else
    i += 1
  end
  l += 1


end

print temp
puts
