# class Board
#   attr_accessor :truth_table
#
#   def initialize(begining, ending)
#     table = (begining..ending)
#     @truth_table = (table.map { |el| [el, true]}).to_h
#   end
#
#   def first
#     @truth_table.first
#   end
#
#   def show
#     puts @truth_table
#   end
#
# end



class Erasto
  attr_accessor :board

  def initialize(begining,ending)
    table = (begining..ending)
    @board = (table.map { |el| [el, true]}).to_h
  end

  def doing_something
    # if @board.first == 1
    #
    # else
      counter = 1
      #current value = board.first
      @board[@board.first * counter] = false
      #counter += 1
    # end
  end
end

obliczenia = Erasto.new(2,5)
obliczenia.doing_something
