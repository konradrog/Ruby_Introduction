def fizzbuzz
  range = (1..100)
  range.each do |el|
    if el % 3 == 0 && el % 5 == 0
      puts "FizzBuzz"
    elsif el % 3 == 0
      puts "Fizz"
    elsif el % 5 == 0
      puts "Buzz"
    else
      puts el
    end
  end
end

fizzbuzz
