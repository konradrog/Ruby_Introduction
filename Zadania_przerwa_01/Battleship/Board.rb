

class Point
  attr_accessor :empty, :selected, :busy, :shot_down, :status

  def initialize(position)
    @empty = true
    @selected = false
    @busy = false
    @shot_down = false
    @status = [@empty, @selected, @busy, @shot_down]
    @position = [position[0],position[1]]
  end
end

class Board
  #include ObjectSpace
  attr_accessor :proper_board

  def initialize
    # @proper_board = {
    #   "A" => [],"B" => [], "C" => [], "D" => [], "E" => [],
    #   "F" => [], "G" => [], "H" => [], "I" => [], "J" => []}
    # @proper_board.each_value do |v|
    #   10.times do
    #     v <<
    #   end
    # end
    @proper_board = create_new_board
  end

  def create_new_board
    result = {
      "A" => [],"B" => [], "C" => [], "D" => [], "E" => [],
      "F" => [], "G" => [], "H" => [], "I" => [], "J" => []}
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    i = 0
    while i < 10
      j = 1
      10.times do
        result[letters[i]] << Point.new([letters[i], (j).to_s])
        j += 1
      end
      i += 1
    end
    result
  end

  def draw_board
    first_row
    puts
    divider
    draw_game_board(proper_board)
    #draw_game_board2(proper_board)
    puts
  end

  def first_row
    row = [" ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    puts

    divider

    row.each do |el|
      print "| #{el} "
    end
    print "|"
  end
  def divider
    11.times do
      print "+---"
    end
    print "+"
    puts
  end
  def draw_game_board2(proper_board)
    i = 0
    j = 10
    proper_board.each do |el|
      if i % 10 == 1
        print "| #{i} "
      else
      end
      case el
      when el.empty && el.selected
        print "|   "
      end

      i += 1


    end
  end


  def draw_game_board(proper_board)
    i = 1
    proper_board.each_value do |v|
      if i != 10
        print "| #{i} "
      else
        print "| #{i}"
      end

      v.each do |el|
        case 
        when el.status[0] && !el.status[1]
          print "|   "
        end
      end
      print "|"
      puts
      divider
      i +=1
    end
  end

  def read_input(input)
    useful_input = []
    useful_input << input[0]
    input[0] = ""
    if input[1] != nil
      useful_input << input[0] + input [1]
    else
      useful_input << input[0]
    end
    useful_input
  end

end

class Ship < Point
  attr_accessor :size, :deck, :ship_area

  def initialize(size)
    @size = size
    @deck = {}
    @ship_area = 0
  end

  def random_position
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    position = [letters[rand(9)], rand(1..10)]
  end


  def build_ship(size)
    random_position

  end


end
require "pp"
board = Board.new
# board.proper_board.each do |el|
#   puts el.status
#


board.draw_board

#board.create_new_board
#Ship.new(1).build_ship(1)
