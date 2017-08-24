def word_count(input_string)
  input_string = input_string.downcase!.split(" ")
  result = input_string.group_by do |word|
    word
  end
  result.transform_values { |v| v.size }
end

puts word_count('foo Foo bar bar Bar')
#=> { "foo" => 2, "bar" => 3 }
puts word_count('Losowy ciąg znaków ciąg')
