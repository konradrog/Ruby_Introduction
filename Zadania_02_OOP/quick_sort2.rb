input2 = [7, 6, 10, 1, 9]
#result after first...
#     = []
####
print input2[0]
puts

#comparator = input2.size - 1
#puts comparator
third = []
third2 = []
result = []
def quick_sort(input_table,result)
  first_step = compare(input_table)
  result << first_step
  second_step = divide_table(first_step)
  if second_step[0].size > 1 || second_step[1].size > 1
    third = quick_sort(second_step[0], result)
    third2 = quick_sort(second_step[1], result)
  end
  return [result]
end

def divide_table(input)
  #if input.size > 1
    divider = input.size / 2
    last_element = input.size - 1
    input1 = input[0..divider - 1]
    input2 = input[divider..last_element]
    return [input1, input2]
  #end
end

def compare(input2)
  input = input2
  comparator = input.size - 1
  i = 0
  j = 0
  while i < comparator
    if  input[i] <= input[comparator]
      input[i], input[j] = input[j], input[i]
      j += 1

    end
    i += 1
  end
  input
end
require "pp"
pp quick_sort(input2,result)
print divide_table(input2)
