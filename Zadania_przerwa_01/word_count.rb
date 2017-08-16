def word_count(input_string)
  input_string = input_string.downcase!.split(" ")
  counter = 0
  amount = 0
  result = {}
  while counter < input_string.size
    input_string.each do |el|
      if el == input_string[counter]
        amount += 1
      end
    end
    result.store(input_string[counter], amount)
    counter += 1
    amount = 0
  end
  result
end

puts word_count('foo Foo bar bar Bar')
#=> { "foo" => 2, "bar" => 3 }
puts word_count('Losowy ciąg znaków ciąg')
