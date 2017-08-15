def hamming_distance(string1, string2)
  if string1.size == string2.size
    counter = 0
    distance = 0
    while counter < string1.size
      if string1[counter] != string2[counter]
        distance += 1
      end
      counter += 1
    end
  else
    nil
  end
  puts distance
end


hamming_distance('1234', '1235')
hamming_distance('GAGCCT', 'CATCGT')
hamming_distance('1234', '12345')
hamming_distance('123', 'foobar')
