def get_number
  numbers= []
  print "Enter first number: "
  numbers[0] = gets.to_i
  print "Enter second number: "
  numbers[1] = gets.to_i
  return numbers
end

def add(num)
  print "==> #{num[0]} + #{num[1]} = #{num[0] + num[1]}\n"
  gets
end

def sub(num)
  print "==> #{num[0]} - #{num[1]} = #{num[0] - num[1]}\n"
  gets
end

def multi(num)
  print "==> #{num[0]} * #{num[1]} = #{num[0] * num[1]}\n"
  gets
end

def div(num)
  print "==> #{num[0]} / #{num[1]} = #{num[0] / num[1]}\n"
rescue ZeroDivisionError
  puts Float::INFINITY
  puts "Don't divide by 0! "
  gets
end

def calc
  loop do
    puts "\n Choose operation:
     1. Add numbers
     2. Subtract numbers
     3. Multiply numbers
     4. Divide numbers
     5. Quit"
     print " What is your choice?: "
     z = gets.to_i
    case z
    when 1
      add(get_number)
    when 2
      sub(get_number)
    when 3
      multi(get_number)
    when 4
      div(get_number)
    when 5
      exit
    end
  end
end


calc
