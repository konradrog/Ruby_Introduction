def decode_morse(input)
  result = ""
  input = input.split(" ")
  input.each do |el|
    result << decoding(el)
  end
  puts result
end

def decoding(input)
  case input
  when ".-"
    "A"
  when "-..."
    "B"
  when "-.-."
    "C"
  when "-.."
    "D"
  when "."
    "E"
  when "..-."
    "F"
  when "--."
    "G"
  when "...."
    "H"
  when ".."
    "I"
  when ".---"
    "J"
  when "-.-"
    "K"
  when ".-.."
    "L"
  when "--"
    "M"
  when "-."
    "N"
  when "---"
    "O"
  when ".-.-"
    "P"
  when "--.-"
    "Q"
  when ".-."
    "R"
  when "..."
    "S"
  when "-"
    "T"
  when "..-"
    "U"
  when "...-"
    "V"
  when ".--"
    "W"
  when "-..-"
    "X"
  when "-.--"
    "Y"
  when "--.."
    "Z"
  else
    "*"
  end
end

decode_morse('.... . .-.. .-.. --- .-- --- .-. .-.. -..') #=> "HELLOWORLD"
