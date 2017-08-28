class Checkout
  attr_accessor :service_time

  def initialize
    @service_time = 0
  end

  def add_client(time)
    @service_time += time
  end
end

def queue_time(client_times, number_of_checkouts)
  clients = client_times
  result = []
  checkouts = []
  number_of_checkouts.times do
    checkouts << Checkout.new
  end

  if number_of_checkouts == 1;
    result = clients.sum
  else
    checkouts.each do |val|
      val.add_client(clients.first)
      clients.shift
    end
    puts "clients after first tour #{clients}"
    while clients.size > 0
      temp = []
      checkouts.each do |val|
        temp << val.service_time
      end
      puts "temp values #{temp}"
      min_index = temp.find_index(temp.min)
      puts "first client #{clients.first}"
      checkouts[min_index].add_client(clients.first)

      clients.shift
    end


    puts "min: #{temp.find_index(temp.min)}"

    checkouts.each { |e| result << e.service_time }
    result = result.max
  end
  puts "rest of clients #{clients}"
  puts "result: #{result}"
  puts "****************************"
  result
end




puts queue_time([5, 3, 4], 1) #=> 12
puts queue_time([10, 2, 3, 3], 2) #=> 10
puts queue_time([2, 3, 10], 2) #=> 12
puts queue_time([5, 6, 7, 2, 10, 11], 3) #=> 18
