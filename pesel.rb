pesel = ARGV[0]

y = pesel[0] + pesel[1]
m = (pesel[2] + pesel[3]).to_i
d = pesel[4] + pesel[5]
s = pesel[9].to_i

def m_or_f(s)
  if s % 2 == 0 || s == 0
    "Kobieta"
  else
    "Mężczyzna"
  end
end

def control(pesel)
  control_number = (9*pesel[0].to_i + 7*pesel[1].to_i + 3*pesel[2].to_i +
  1*pesel[3].to_i + 9*pesel[4].to_i + 7*pesel[5].to_i + 3*pesel[6].to_i +
  1*pesel[7].to_i + 9*pesel[8].to_i + 7*pesel[9].to_i).to_s
  if control_number[control_number.length - 1] == pesel[10]
    true
  else
    false
  end
end

def month(m,y)
  if m >= 1 && m <= 12
    y = "19#{y}"
  elsif m >= 21 && m <= 32
    m -= 20
    y = "20#{y}"
  elsif m >= 41 && m <= 52
    m -= 40
    y = "21#{y}"
  elsif m >= 61 && m <= 72
    m -= 60
    y = "22#{y}"
  elsif m >= 81 && m <= 92
    m -= 80
    y = "18#{y}"
  end
  if m < 10
    m = "0#{m}"
  end
  return [m, y]
end


date2 = month(m,y)

if pesel.size != 11 || control(pesel) != true
  puts "PESEL #{pesel} jest nieprawidłowy"
  exit
end

puts "Pesel #{pesel} jest prawidłowy.
Informacje o peselu:
  - płeć: #{m_or_f(s)}
  - data urodzenia: #{d}-" + date2[0] + "-" + date2[1]
