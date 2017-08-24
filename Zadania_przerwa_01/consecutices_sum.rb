def consecutives_sum(array)
  result = []
  temp = 0
  array.each_with_index do |el, i|
    if array[i] == array[i + 1]
      puts "*"
      temp += array[i]
    else
      if temp != 0
        temp += array[i]
        result << temp
        temp = 0
      else
        result << array[i]
      end
    end
  end
  result
end

print consecutives_sum([1, 4, 4, 4, 0, 4, 3, 3, 1, 1]) #=> [1, 12, 0, 4, 6, 1]
puts
print consecutives_sum([1, 1, 7, 7, 3])
puts#=> [2, 14, 3]
print consecutives_sum([-5, -5, 7, 7, 12, 0])
#=> [-10, 14, 12, 0]
