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
  clients = client_times.dup
  result = []
  checkouts = []
  number_of_checkouts.times do
    checkouts << Checkout.new
  end

  while clients.size > 0
    temp = []
    checkouts.each do |val|
      temp << val.service_time
    end
    min_index = temp.find_index(temp.min)
    checkouts[min_index].add_client(clients.first)
    clients.shift
  end
  checkouts.each { |e| result << e.service_time }
  result = result.max
end

puts queue_time([5, 3, 4], 1) #=> 12
puts queue_time([10, 2, 3, 3], 2) #=> 10
puts queue_time([2, 3, 10], 2) #=> 12
puts queue_time([5, 6, 7, 2, 10, 11], 3) #=> 18
puts queue_time([2,2,2],3)
puts queue_time([4, 5, 3, 15], 3)
puts queue_time([4, 5, 3, 15, 14, 13], 3)
