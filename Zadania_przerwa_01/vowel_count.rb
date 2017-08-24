def vowel_count(input_string)
  vowels = ["a", "e", "i", "o", "u", "y"]
  counter = 0
  input_string.downcase.each_char do |char|
    if vowels.include? char
      counter += 1
    end
  end
  counter
end

puts vowel_count("Jan Zieliński")
