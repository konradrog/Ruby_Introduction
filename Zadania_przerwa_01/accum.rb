def accum(input_string)
  input_string.downcase!
  counter = 0
  result = ""
  while counter < input_string.size
    input_string.each_char do |char|
      result << char.upcase
      counter.times {result << char}
      result << "-"
      counter += 1
    end
  end
  puts result.chop
end

accum("abcd")#=> "A-Bb-Ccc-Dddd"
accum("RqaEzty") #=> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
accum("cwAt")#=> "C-Ww-Aaa-Tttt"
