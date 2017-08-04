def find_index(array, value)
  if array.empty?
    puts "Not Found"
  else
    index = array.index(value)
    if index != nil
      puts index
    else
      puts "Not Found"
    end
  end
end

find_index([1, 2, 3, 4, 5], 3)
find_index([5, 8, 6, 2, 2, 10], 2)
find_index([10, 20, 30], 100)
find_index([], 0)
