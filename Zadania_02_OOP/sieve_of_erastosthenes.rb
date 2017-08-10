class Erasto
  attr_accessor :board

  def initialize(begining,ending)
    table = (begining..ending)
    @board = (table.map { |el| [el, true]}).to_h
    @board_m = {}
  end

  def doing_something
    board_m = @board

    first_el = board_m.keys.first
    counter = 1
    while first_el * counter< board.keys.last
      board_m[first_el * counter] = false
      counter += 1
    end
    @board_m = board_m
  end

end

obliczenia = Erasto.new(2,5)
puts obliczenia.board
obliczenia.doing_something
puts obliczenia.board
