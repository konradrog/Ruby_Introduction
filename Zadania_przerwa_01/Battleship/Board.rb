

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
    @deck = []
    @ship_area = 0
  end

  def random_position
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    position = [letters[rand(9)], rand(0..9)]
  end


  def build_ship(size, proper_board)
    rp = random_position
    while proper_board[rp[0]][rp[1]].ship_ship || proper_board[rp[0]][rp[1]].ship_area
      rp = random_position
    end
    case size
    when 1
      area = build_area_for_1(rp, proper_board)
      area.each { |el| el.ship_area = true }
      proper_board[rp[0]][rp[1]].ship_ship = true
    when 2
      deck = build_deck_for_2(rp, proper_board)
      #area = build_area_for_2(deck, proper_board)
      puts deck
      puts rp
      #deck[0].ship_ship = true
      deck.each {|e| e.ship_ship = true}
      proper_board[rp[0]][rp[1]].ship_ship = true
    end


  end

  def build_area_for_1(position, board)
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
  def build_deck_for_2(position, board)
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    key_value = letters.index(position[0])
    result = []


    left_k = letters[key_value - 1]
    mid_k = letters[key_value]
    right_k = letters[key_value + 1]

    if mid_k == "A"
      top = board[mid_k][position[1] - 1]
      right = board[right_k][position[1]]
      bottom = board[mid_k][position[1] + 1]
    elsif mid_k == "J"
      top = board[mid_k][position[1] - 1]
      bottom = board[mid_k][position[1] + 1]
      left = board[left_k][position[1]]
    elsif board[position[1]] == 0
      right = board[right_k][position[1]]
      bottom = board[mid_k][position[1] + 1]
      left = board[left_k][position[1]]
    elsif board[position[1]] == 9
      top = board[mid_k][position[1] - 1]
      right = board[right_k][position[1]]
      left = board[left_k][position[1]]
    else
      top = board[mid_k][position[1] - 1]
      right = board[right_k][position[1]]
      bottom = board[mid_k][position[1] + 1]
      left = board[left_k][position[1]]
    end


    if !top.ship_ship && !top.ship_area
      result << top
      puts "top"
    elsif !right.ship_ship && !right.ship_area
      result << right
      puts "right"
    elsif !bottom.ship_ship && !bottom.ship_area
      result << bottom
      puts "bot"
    elsif !left.ship_ship && !left.ship_area
      result << left
      puts "left"
    end

    result << board[mid_k][position[1]]
    # ustawic sortowanie, tak, żeby pierwszy był mniejszy wiersz
  end
  def build_area_for_2(deck, board)
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    key_value = letters.index(deck[0].position[0])
    result = []

    if deck[0].position[1] == deck[1].position[1]
      left = letters[key_value - 1]
      mid = letters[key_value]
      right = letters[key_value + 1]
    else
      left = letters[key_value - 1]
      mid_left = letters[key_value]
      mid_right = letters[key_value + 1]
      right = letters[key_value + 2]
    end
    #deck[0].position[1] = deck[0].position[1].to_i
 # dla konfiguracji pionowej
    if deck[0].position[1] == 0 #czyli pierwszy wiersz
      if mid == "A"
        result << mid4 = board[mid][deck[0].position[1] + 2]
        result << right2 = board[right][deck[0].position[1]]
        result << right3 = board[right][deck[0].position[1] + 1]
        result << right4 = board[right][deck[0].position[1] + 2]
      elsif mid == "J"
        result << left2 = board[left][deck[0].position[1]]
        result << left3 = board[left][deck[0].position[1] + 1]
        result << left4 = board[left][deck[0].position[1] + 2]
        result << mid4 = board[mid][deck[0].position[1] + 2]
      else
        result << left2 = board[left][deck[0].position[1]]
        result << left3 = board[left][deck[0].position[1] + 1]
        result << left4 = board[left][deck[0].position[1] + 2]
        result << mid4 = board[mid][deck[0].position[1] + 2]
        result << right2 = board[right][deck[0].position[1]]
        result << right3 = board[right][deck[0].position[1] + 1]
        result << right4 = board[right][deck[0].position[1] + 2]
      end
    elsif deck[0].position[1] == 8 #ostatni wiersz
      if mid == "A"
        result << mid1 = board[mid][deck[0].position[1] - 1]
        result << right1 = board[right][deck[0].position[1] - 1]
        result << right2 = board[right][deck[0].position[1]]
        result << right3 = board[right][deck[0].position[1] + 1]
      elsif mid == "J"
        result << left1 = board[left][deck[0].position[1] - 1]
        result << left2 = board[left][deck[0].position[1]]
        result << left3 = board[left][deck[0].position[1] + 1]
        result << mid1 = board[mid][deck[0].position[1] - 1]
      else
        result << left1 = board[left][deck[0].position[1] - 1]
        result << left2 = board[left][deck[0].position[1]]
        result << left3 = board[left][deck[0].position[1] + 1]
        result << mid1 = board[mid][deck[0].position[1] - 1]
        result << right1 = board[right][deck[0].position[1] - 1]
        result << right2 = board[right][deck[0].position[1]]
        result << right3 = board[right][deck[0].position[1] + 1]
      end
    elsif mid == "A"
      result << mid1 = board[mid][deck[0].position[1] - 1]
      result << mid4 = board[mid][deck[0].position[1] + 2]
      result << right1 = board[right][deck[0].position[1] - 1]
      result << right2 = board[right][deck[0].position[1]]
      result << right3 = board[right][deck[0].position[1] + 1]
      result << right4 = board[right][deck[0].position[1] + 2]
    elsif mid == "J"
      result << left1 = board[left][deck[0].position[1] - 1]
      result << left2 = board[left][deck[0].position[1]]
      result << left3 = board[left][deck[0].position[1] + 1]
      result << left4 = board[left][deck[0].position[1] + 2]
      result << mid1 = board[mid][deck[0].position[1] - 1]
      result << mid4 = board[mid][deck[0].position[1] + 2]
    else #to wyjściowo
      result << left1 = board[left][deck[0].position[1] - 1]
      result << left2 = board[left][deck[0].position[1]]
      result << left3 = board[left][deck[0].position[1] + 1]
      result << left4 = board[left][deck[0].position[1] + 2]
      result << mid1 = board[mid][deck[0].position[1] - 1]
      result << mid4 = board[mid][deck[0].position[1] + 2]
      result << right1 = board[right][deck[0].position[1] - 1]
      result << right2 = board[right][deck[0].position[1]]
      result << right3 = board[right][deck[0].position[1] + 1]
      result << right4 = board[right][deck[0].position[1] + 2]
    end


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
ship5 = Ship.new(2)
ship6 = Ship.new(2)
ship7 = Ship.new(2)

ship.build_ship(1, board.proper_board)
#board.draw_board
ship2.build_ship(1, board.proper_board)
#board.draw_board
ship3.build_ship(1, board.proper_board)
#board.draw_board
ship4.build_ship(1, board.proper_board)
ship5.build_ship(2, board.proper_board)
ship6.build_ship(2, board.proper_board)
ship7.build_ship(2, board.proper_board)
board.draw_board
