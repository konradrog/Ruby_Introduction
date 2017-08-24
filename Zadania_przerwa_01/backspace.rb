def backspace(string)
  if string == ""
    return string
  end
  counter = 0
  while string.include? "#"
    if string.index("#") - 1 >= 0
      string[string.index("#") - 1] = ""
      string[string.index("#")] = ""
    else
      string[string.index("#")] = ""
    end
  end
  string
end

puts backspace("a#bc#d") #{}"bd"
puts backspace("abc#d##c") # "ac"
puts backspace("abc##d######") #jest równy ""
puts backspace("######") #jest równy ""
puts backspace("") #jest równy (")
