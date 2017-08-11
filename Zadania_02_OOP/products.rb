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

# def more_exp(file, price)
#   cheaper = []
#   more_exp = []
#   file.each do |row|
#     if row[1].to_i > price
#       more_exp << "#{row[0]} #{row[1]}zł"
#     elsif row[1].to_i < price
#       cheaper << "#{row[0]} #{row[1]}zł"
#     end
#   end
#
#   return [more_exp.sort, cheaper.sort]
# end

def main(file,input)
  case input[0]
  when "-f"
    puts find_product(file, input[1])
  when "-gt"
    puts more_exp(file, input[1].to_i)
  when "-lt"
  when "-c"
  end
end

main(file, ARGV)
