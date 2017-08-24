def complementary_DNA(input_DNA)
  input_DNA.tr('ATCG', 'TAGC')
end

puts complementary_DNA("ATTA") #=> "TAAT"
puts complementary_DNA("CGGC") #=> "GCCG"
puts complementary_DNA("ACGTTAGTTA") #=> "TGCAATCAAT"
