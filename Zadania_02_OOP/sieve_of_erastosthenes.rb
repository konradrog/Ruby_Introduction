class Board
  def initialize(begining, ending)
    @table = (begining..ending)
    @truth_table = (@table.map { |el| [el, true]}).to_h
  end

  def show
    @table.each {|e| puts e}
    puts @truth_table
  end
end


board = Board.new(1, 5)
board.show
