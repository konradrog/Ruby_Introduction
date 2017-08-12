def quick_sort(input_table, first_index, last_index)
  if first_index < last_index
    pivot_index = compare(input_table, first_index, last_index)
    quick_sort(input_table, first_index, pivot_index - 1)
    quick_sort(input_table, pivot_index + 1, last_index)
  end
  input_table
end

def compare(input, first_index, comparator)
  i = first_index
  current_index = first_index
  while i < comparator
    if  input[i] <= input[comparator]
      input[i], input[current_index] = input[current_index], input[i]
      current_index += 1
    end
    i += 1
  end
  input[comparator], input[current_index] = input[current_index], input[comparator]
  current_index
end

result = quick_sort(ARGV, 0, ARGV.size - 1)
print result.map! {|e| e.to_i}
