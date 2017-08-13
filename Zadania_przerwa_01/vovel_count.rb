def vovel_count(input_string)
  vowels = ["a", "e", "i", "o", "u", "y"]
  counter = 0
  vowels.each do |e|
    input_string.downcase.each_char do |el|
      if e == el
        counter += 1
      end
    end
  end
  counter
end

puts vovel_count("Alamlame")
