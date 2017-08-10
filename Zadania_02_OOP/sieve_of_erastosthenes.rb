class Erasto
  attr_accessor :board, :board_final

  def initialize(begining,ending)
    table = (begining..ending)
    @board = (table.map { |el| [el, true]}).to_h
    @board_final = []
  end

  def doing_something
    board_final = @board

    while board_final.has_value?(true)
      first_el = board_final.keys.first
      if board_final[first_el] == true && first_el != 1
        @board_final << first_el
      else
        board_final.delete(first_el)
      end
      counter = 1
      while first_el * counter <= board.keys.last
        board_final[first_el * counter] = false
        counter += 1
      end
      board_final.delete(first_el)
    end
    @board = board_final
  end
end

obliczenia = Erasto.new(1,50)
puts obliczenia.board
obliczenia.doing_something
puts obliczenia.board
print obliczenia.board_final #
