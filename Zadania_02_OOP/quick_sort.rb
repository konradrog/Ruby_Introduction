input = [7, 2, 4, 7, 3, 1, 4, 6, 5, 8, 3, 9, 2, 6, 7, 6, 3]
input2 = [74, 77, 64, 19, 43, 47, 77, 66, 47, 60, 7, 97, 71, 87, 95, 79]

def q_s(input)
  temp = input
  temp[temp.size / 2], temp[temp.size - 1] = temp[temp.size - 1], temp[temp.size / 2]
  piwot = temp[temp.size - 1]
  i = 1
  j = 0
  while i < (temp.size - 2)
    if  temp.at(i) < piwot
      temp[j], temp[i] = temp[i], temp[j]
      j += 1
    end
    i += 1
  end
  temp[temp.size - 1], temp[j] = temp[j], temp[temp.size - 1]

  temp_left = temp[0...(temp.size / 2)]
  temp_right = temp[(temp.size / 2)+ 1..temp.size - 1]
  return [temp, temp_left, temp_right]
end


require "pp"

first_step = q_s(input)
pp first_step
second_step1 =  q_s(first_step[1])
second_step2 =  q_s(first_step[2])

pp second_step1
pp second_step1

third_step1 = q_s(second_step1[1])
third_step2 = q_s(second_step1[2])
third_step3 = q_s(second_step2[1])
third_step4 = q_s(second_step2[2])

pp third_step1
pp third_step2
pp third_step3
pp third_step4
