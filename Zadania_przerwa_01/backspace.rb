def backspace(string)
  if string == ""
    return string
  end
  counter = 0
  size = string.length
  result = ""
  while string.include? "#"
    string[string.index("#") - 1] = ""
    string[string.index("#")] = ""
  end
  puts string
end

backspace("a#bc#d") #{}"bd"
backspace("abc#d##c") # "ac"
backspace("abc##d######") #jest równy ""
backspace("######") #jest równy ""
backspace("") #jest równy (")
