def consecutives_sum(array)
  result = []
  counter = 0
  temp = 0
  while counter < array.size
    if array[counter] == array[counter + 1] && array[counter] != array[array.size - 1]
      temp += array[counter]
    else
      if temp != 0
        temp += array[counter]
        result << temp
        temp = 0
      else
        result << array[counter]
      end
    end
    counter += 1
  end
  print result
  puts
end

consecutives_sum([1, 4, 4, 4, 0, 4, 3, 3, 1]) #=> [1, 12, 0, 4, 6, 1]
consecutives_sum([1, 1, 7, 7, 3])
#=> [2, 14, 3]
consecutives_sum([-5, -5, 7, 7, 12, 0])
#=> [-10, 14, 12, 0]
