def fibbo(n)
  if n == 0
    puts 0
  elsif n == 1
    puts 0
    puts 1
  else
    first = 0
    second = 1
    counter = 1
    puts first, counter
    while counter < n-1
      sum = first + second
      puts sum
      counter += 1
      first = second
      second = sum
    end
  end
end

fibbo(ARGV[0].to_i)
