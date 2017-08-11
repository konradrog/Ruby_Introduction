require "csv"
require "pp"

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

def more_exp(file, price)
  more_exp = []
  file.each do |row|
    if row[1].to_i > price
      more_exp << [row[0], row[1].to_f]
    end
  end
  more_exp.sort_by! {|el| el[1]}
  more_exp.map! {|el| el = "%-10s #{el[1]}zł" % el[0]}
  return more_exp[0..3]
end

def cheaper(file, price)
  cheaper = []
  file.each do |row|
    if row[0] == "Product"
    elsif row[1].to_i < price
      cheaper << [row[0], row[1].to_f]
    end
  end
  cheaper.sort_by! {|el| el[1]}
  cheaper.map! {|el| el = "%-10s #{el[1]}zł" % el[0]}
  return cheaper[0..4]
end

def convert(file, exchange_rates)
  temp = []
  file.each do |row|
    row[1] = "%.2f" % (row[1].to_i * exchange_rates)
    temp << row
  end
  temp
end

def save_to_file(file, exchange_rates, currency, new_filename)
  table = convert(file, exchange_rates)
  table[0][1] = "Price(#{currency})"
  new_file = CSV.open("#{new_filename}", "wb") do |row|
      table.each {|el| row << el}
  end
end

def main(file,input)
  case input[0]
  when "-f"
    puts find_product(file, input[1])
  when "-gt"
    puts more_exp(file, input[1].to_i)
  when "-lt"
    puts cheaper(file, input[1].to_i)
  when "-c"
    pp save_to_file(file, input[1].to_f, input[2], input[3])
  end
end

main(file, ARGV)
