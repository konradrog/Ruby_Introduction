require "csv"

file = CSV.read("products.csv")
#puts file[0]
def find_product(file, name)
  temp = []
  file.each do |row|
    if row[0] == name
      temp << row
    end
  end
  "#{temp[0][0]} #{temp[0][1]}zł "
end

puts find_product(file, "carrot")

def main(file,input)
  case input[0]
  when "-f"
    puts find_product(file, input[1])
  when "-gt"
  when "-lt"
  when "-c"
  end
end

main(file, ARGV)
