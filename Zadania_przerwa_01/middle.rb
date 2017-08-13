def middle(input_string)
  result = ""
  if input_string.size % 2 == 0
    result << input_string[(input_string.size / 2) - 1]
    result << input_string[input_string.size / 2]
  else
    result << input_string[input_string.size / 2]
  end
  result
end

puts middle("teststring")
