

class Point
  attr_accessor :empty, :selected, :busy, :shot_down, :ship_ship, :ship_area, :position

  def initialize(position)
    @empty = true
    @selected = false
    @busy = false
    @shot_down = false
    @ship_ship = false
    @ship_area = false
    #@status = [@empty, @selected, @busy, @shot_down]
    @position = [position[0],position[1]]
  end
end

class Board
  attr_accessor :proper_board

  def initialize
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


  def draw_game_board(proper_board)
    i = 1
    10.times do
      if i != 10
        print "| #{i} "
      else
        print "| #{i}"
      end
      proper_board.each_value do |el|
        case
        when el[i-1].busy && el[i-1].ship_ship
          print "| - "
        when el[i-1].ship_area
          print "| * "
        when el[i-1].ship_ship
          print "| - "
        when el[i-1].empty && !el[i-1].selected
          print "|   "
        when el[i-1].empty && el[i-1].selected
          print "| . "

        when el[i-1].busy
          print "| * "
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

class Ship
  attr_accessor :size, :deck, :ship_area

  def initialize(size)
    @size = size
    @deck = {}
    @ship_area = 0
  end

  def random_position
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    position = [letters[rand(9)], rand(0..9)]
  end


  def build_ship(proper_board)
    rp = random_position
    while proper_board[rp[0]][rp[1]].ship_ship || proper_board[rp[0]][rp[1]].ship_area
      rp = random_position
    end
    area = build_area(rp, proper_board)
    area.each { |el| el.ship_area = true }
    proper_board[rp[0]][rp[1]].ship_ship = true

    # while !proper_board[rp[0]][rp[1]].busy
    #   area = build_area(rp, proper_board)
    #   area.each do |el|
    #     if !el.busy && !el.ship_area
    #       el.busy = true
    #       #el.ship_area = true
    #     else
    #       area.each { |e| e.busy = false}
    #       rp = random_position
    #       puts "next would be #{rp}"
    #       next
    #       #puts "second #{rp}"
    #       #build_ship(proper_board)
    #     end
    #
    #
    #     # proper_board[rp[0]][rp[1]].ship_ship = true
    #   end
    #   proper_board[rp[0]][rp[1]].busy = true
    # end
    # puts "end #{rp}"
  end

  def build_area(position, board)
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    key_value = letters.index(position[0])
    #puts "key: #{key_value}"
    result = []

    left = letters[key_value - 1]
    mid = letters[key_value]
    right = letters[key_value + 1]
    print "l: #{left} m: #{mid} r: #{right}"
    puts



    if position[1] == 0
      if mid == "A"
        result << mid3 = board[mid][position[1] + 1]
        result << right2 = board[right][position[1]]
        result << right3 = board[right][position[1] + 1]
      elsif mid == "J"
        result << left2 = board[left][position[1]]
        result << left3 = board[left][position[1] + 1]
        result << mid3 = board[mid][position[1] + 1]
      else
        result << left2 = board[left][position[1]]
        result << left3 = board[left][position[1] + 1]
        result << mid3 = board[mid][position[1] + 1]
        result << right2 = board[right][position[1]]
        result << right3 = board[right][position[1] + 1]
      end
    elsif position[1] == 9
      if mid == "A"
        result << mid1 = board[mid][position[1] - 1]
        result << right1 = board[right][position[1] - 1]
        result << right2 = board[right][position[1]]
      elsif mid == "J"
        result << left1 = board[left][position[1] - 1]
        result << left2 = board[left][position[1]]
        result << mid1 = board[mid][position[1] - 1]
      else
        result << left1 = board[left][position[1] - 1]
        result << left2 = board[left][position[1]]
        result << mid1 = board[mid][position[1] - 1]
        result << right1 = board[right][position[1] - 1]
        result << right2 = board[right][position[1]]
      end
    elsif mid == "A"
      result << mid1 = board[mid][position[1] - 1]
      result << mid3 = board[mid][position[1] + 1]
      result << right1 = board[right][position[1] - 1]
      result << right2 = board[right][position[1]]
      result << right3 = board[right][position[1] + 1]
    elsif mid == "J"
      result << left1 = board[left][position[1] - 1]
      result << left2 = board[left][position[1]]
      result << left3 = board[left][position[1] + 1]
      result << mid1 = board[mid][position[1] - 1]
      result << mid3 = board[mid][position[1] + 1]
    else
      result << left1 = board[left][position[1] - 1]
      result << left2 = board[left][position[1]]
      result << left3 = board[left][position[1] + 1]
      result << mid1 = board[mid][position[1] - 1]
      result << mid3 = board[mid][position[1] + 1]
      result << right1 = board[right][position[1] - 1]
      result << right2 = board[right][position[1]]
      result << right3 = board[right][position[1] + 1]
    end
    result
  end
end


require "pp"
board = Board.new
board.draw_board
#puts board.proper_board["B"]
ship = Ship.new(1)
ship2 = Ship.new(1)
ship3 = Ship.new(1)
ship4 = Ship.new(1)
ship.build_ship(board.proper_board)
#board.draw_board
ship2.build_ship(board.proper_board)
#board.draw_board
ship3.build_ship(board.proper_board)
#board.draw_board
ship4.build_ship(board.proper_board)
board.draw_board
