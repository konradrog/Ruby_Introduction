def queue_time(clients, checkout)
  result = 0
  shop = []

  if checkout == 1
    result = clients.inject(0) { |acc, el| acc + el}
  elsif checkout > 1
    checkout.times do
      shop << Checkout.new(checkout)
    end
    counter_cl = 0
    while counter_cl <= clients.size
      counter_ch = 0
      while counter_ch < shop.size
        if shop[counter_ch].busy == false && clients[counter_cl] != nil
          shop[counter_ch].new_client(clients[counter_cl])
          counter_cl += 1
        end
        counter_ch += 1
      end

      puts shop[0].time_left
      puts shop[1].time_left

      case shop[0].time_left <=> shop[1].time_left
      when 1
        shop[0].time_left -= shop[1].time_left
        result += shop[1].time_left
        shop[1].release
      when -1
        shop[1].time_left -= shop[0].time_left
        result += shop[0].time_left
        shop[0].release
      end

      if counter_cl >= clients.size
        result += shop[1].time_left
        result += shop[0].time_left
        break
      end

      puts shop[0].time_left
      puts shop[1].time_left
      puts "counter #{counter_cl}"
      puts "_______________"


    end
  end
  puts "result : #{result}"
  #puts result
end

class Checkout
  attr_accessor :time_left, :busy, :id

  def initialize(id)
    @id = id
    @busy = false
    @time_left = 0
  end

  def new_client(time)
    @time_left = time
    @busy = true
  end

  def release
    @time_left = 0
    @busy = false
  end
end

queue_time([5,3,4], 1) #=> 12
queue_time([10, 2, 3, 3], 2) #=> 10
queue_time([2, 3, 10], 2) #=> 12
