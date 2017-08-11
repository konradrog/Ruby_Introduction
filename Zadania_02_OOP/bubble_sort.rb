def convert(input)
  temp = []
  input.each do |el|
    el = el.to_i
    temp << el
  end
  temp
end

def bubble_sort(temp)
  temp = convert(temp)
  temp.size.times do
    i = 0
    j = 1
    while j < temp.size - 1
      if temp[i] > temp[j]
        temp[i], temp[j] = temp[j], temp[i]
      end
      i += 1
      j += 1
    end
  end
  temp
end


print bubble_sort(ARGV)
puts
