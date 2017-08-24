def palindrome?(input_string)
  input_string = input_string.split(" ").join.downcase
  input_string == input_string.reverse

end

puts palindrome?('Kobyła ma mały bok') #=> true
puts palindrome?('kajak')
#=> true
puts palindrome?('kajak i wiosło')

puts palindrome?("Marzena pokazała Zakopane z ram")
puts palindrome?("A to idiota")
puts palindrome?("Atak kata")
puts palindrome?("Kamil ślimak")
puts palindrome?("Satyra rota to rarytas")
