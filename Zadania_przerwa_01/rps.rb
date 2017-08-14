def rps(first, second)
  case 
  when first == 'paper' && second == 'scissors'
    puts 'Gracz 2 wygrywa'
  when first == 'scissors' && second == 'rock'
    puts 'Gracz 2 wygrywa'
  when first == 'rock' && second == 'paper'
    puts 'Gracz 2 wygrywa'
  when first == 'paper' && second == 'rock'
    puts 'Gracz 1 wygrywa'
  when first == 'rock' && second == 'scissors'
    puts 'Gracz 1 wygrywa'
  when first == 'scissors' && second == 'paper'
    puts 'Gracz 1 wygrywa'
  when first == 'paper' && second == 'paper'
    puts 'Remis'
  when first == 'scissors' && second == 'scissors'
    puts 'Remis'
  when first == 'rock' && second == 'rock'
    puts 'Remis'
  end
end

rps('scissors', 'paper')
#=> 'Gracz 1 wygrywa'
rps('rock', 'paper')
#=> 'Gracz 2 wygrywa'
rps('scissors', 'scissors') #=> 'Remis'
