def pangram? (input_string)
  input_string.downcase!
  alphabet = "aąbcćdeęfghijklłmnńoóprsśtuwyzźż"
  counter = 0
  alphabet.each_char do |char|
    if input_string.include? char
      counter += 1
    end
  end
  if counter == 32
    true
  else
    false
  end
end


pangram?('Dość błazeństw,żrą mój pęk luźnych fig') #=> true
pangram?('Losowy ciąg znaków')
pangram?("Myślę:Fruń z płacht gąsko, jedź wbić nóż")
pangram?("W niżach mógł zjeść truflę koń bądź psy")
pangram?("Dość gróźb fuzją, klnę, pych i małżeństw!")
pangram?("Pójdź w loch zbić małżeńską gęś futryn!")
pangram?("Filmuj rzeź żądań, pość, gnęb chłystków!")
pangram?("O, mógłże sęp chlań wyjść furtką bździn.")
pangram?("Mężny bądź, chroń pułk twój i sześć flag.")
pangram?("kajshdvfkavfkvf")
