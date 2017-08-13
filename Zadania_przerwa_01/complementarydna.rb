def complementary_DNA(input_DNA)
  result = ""
  input_DNA.each_char do |char|
    case char
    when "A"
      result << "T"
    when "T"
      result << "A"
    when "C"
      result << "G"
    when "G"
      result << "C"
    end
  end
  puts result
end

complementary_DNA("ATTA")
complementary_DNA("CGGC")
complementary_DNA("ACGTTAGTTA")
