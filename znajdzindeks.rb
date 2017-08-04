def find_index(array, value)

  if array.empty?
    puts "Not Found"
  end
  checker_found = 0
  checker_not_found = 0

  array.each_index do |el|
    if array.at(el) == value
      puts el
      checker_found += 1
      break
    else
      checker_not_found += 1
    end
  end
  if checker_not_found > 0 && checker_found == 0
    puts "Not Found"
  end
end

find_index([1, 2, 3, 4, 5], 3)
find_index([5, 8, 6, 2, 2, 10], 2)
find_index([10, 20, 30], 100)
find_index([], 0)
