require "curses"



def show_message(message)
  height = 40
  width  = 60
  top    = (Curses.lines - height) / 2
  left   = (Curses.cols - width) / 2
  win = Curses::Window.new(height, width, top, left)
  win.box("|", "-")
  win.setpos(2, 3)
  win.addstr(message)
  win.refresh
  win.getch
  win.close
end


# def interact
#     loop do
#       result = true
#       c = Curses.getch
#       case c
#       when Curses::KEY_DOWN, Curses::KEY_CTRL_N, "j"
#         result = scroll_down
#       when Curses::KEY_UP, Curses::KEY_CTRL_P, "k"
#         result = scroll_up
#       when Curses::KEY_NPAGE, " "
#         (@screen.maxy - 1).times do |i|
#           if !scroll_down && i == 0
#             result = false
#             break
#           end
#         end
#       when Curses::KEY_PPAGE
#         (@screen.maxy - 1).times do |i|
#           if !scroll_up && i == 0
#             result = false
#             break
#           end
#         end
#       when Curses::KEY_LEFT, Curses::KEY_CTRL_T, "h"
#         while scroll_up
#         end
#       when Curses::KEY_RIGHT, Curses::KEY_CTRL_B, "l"
#         while scroll_down
#         end
#       when "q"
#         break
#       else
#         @screen.setpos(0, 0)
#         @screen.addstr("[unknown key `#{Curses.keyname(c)}'=#{c}] ")
#       end
#       if !result
#         Curses.beep
#       end
#       @screen.setpos(0, 0)
#     end
#     Curses.close_screen
#   end
# end

def try_to_move
  c = Curses.getch
  case c
  when Curses::KEY_DOWN, "s"
    show_message("Key down")
  when Curses::KEY_UP, "w"
    show_message("Key down")
  when Curses::KEY_LEFT, "a"
    show_message("Key down")
  when Curses::KEY_RIGHT, "d"
    show_message("Key down")
  end
end

Curses.init_screen
begin
  Curses.crmode
  Curses.setpos((Curses.lines - 1) / 2, (Curses.cols - 11) / 2)
  Curses.addstr("Hit any key")
  Curses.refresh
  Curses.getch
  #show_message("Hello, World!")
  try_to_move
ensure
  Curses.close_screen
end
