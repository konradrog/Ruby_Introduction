def initials(full_name)
  result = ""
  splited = full_name.split(' ')
  splited.each { |el| result << el[0]}
  result.upcase
end

puts initials("Adam Adam Małysz")
