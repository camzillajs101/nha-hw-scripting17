=begin
  Assignment #2, Tic-Tac-Toe
=end

require 'google_drive'
require 'dotenv'
Dotenv.load

session = GoogleDrive::session.from_config("config.json")
puts GoogleDrive::session
ws = session.spreadsheet_by_key(ENV['SHEET_KEY']).worksheets[0]

$winner = nil
def checkForWin(xy)
  row1 = [$ws[2,1],$ws[2,2],$ws[2,3]]
  row2 = [$ws[3,1],$ws[3,2],$ws[3,3]]
  row3 = [$ws[4,1],$ws[4,2],$ws[4,3]]
  column1 = [$ws[2,1],$ws[3,1],$ws[4,1]]
  column2 = [$ws[2,2],$ws[3,2],$ws[4,2]]
  column3 = [$ws[2,3],$ws[3,3],$ws[4,3]]
  all = [$ws[2,1],$ws[2,2],$ws[2,3],$ws[3,1],$ws[3,2],$ws[3,3],$ws[4,1],$ws[4,2],$ws[4,3]]
  tie = "tie"
  [1,2,3,4,5,6,7,8,9].each do |i|
    if all[i] == ""
      tie = "not"
    end
  end
  if tie == false
    if xy == "x"
      $found = false
      if row1[0] == "X"
        if row1[1] == "X"
          if row1[2] == "X"
            $found = true
          end
        end
      end
      if row2[0] == "X"
        if row2[1] == "X"
          if row2[2] == "X"
            $found = true
          end
        end
      end
      if row3[0] == "X"
        if row3[1] == "X"
          if row3[2] == "X"
            $found = true
          end
        end
      end
      if column1[0] == "X"
        if column1[1] == "X"
          if column1[2] == "X"
            $found = true
          end
        end
      end
      if column2[0] == "X"
        if column2[1] == "X"
          if column2[2] == "X"
            $found = true
          end
        end
      end
      if column3[0] == "X"
        if column3[1] == "X"
          if column3[2] == "X"
            $found = true
          end
        end
      end
      if row1[0] == "X"
        if row2[1] == "X"
          if row3[2] == "X"
            $found = true
          end
        end
      end
      if row1[2] == "X"
        if row2[1] == "X"
          if row3[0] == "X"
            $found = true
          end
        end
      end
      return $found
    end
    if xy == "y"
      $found = false
      if row1[0] == "Y"
        if row1[1] == "Y"
          if row1[2] == "Y"
            $found = true
          end
        end
      end
      if row2[0] == "Y"
        if row2[1] == "Y"
          if row2[2] == "Y"
            $found = true
          end
        end
      end
      if row3[0] == "Y"
        if row3[1] == "Y"
          if row3[2] == "Y"
            $found = true
          end
        end
      end
      if column1[0] == "Y"
        if column1[1] == "Y"
          if column1[2] == "Y"
            $found = true
          end
        end
      end
      if column2[0] == "Y"
        if column2[1] == "Y"
          if column2[2] == "Y"
            $found = true
          end
        end
      end
      if column3[0] == "Y"
        if column3[1] == "Y"
          if column3[2] == "Y"
            $found = true
          end
        end
      end
      if row1[0] == "Y"
        if row2[1] == "Y"
          if row3[2] == "Y"
            $found = true
          end
        end
      end
      if row1[2] == "Y"
        if row2[1] == "Y"
          if row3[0] == "Y"
            $found = true
          end
        end
      end
      return $found
    end
  else
    return tie
  end
end
def checkForWin2()
  if checkForWin("x") == true
    puts "\nPlayer 1 wins!"
    $winner = 1
    endGame()
  elsif checkForWin("y") == true
    puts "\nPlayer 2 wins!"
    $winner = 2
    endGame()
  elsif checkForWin("x") == "tie"
    puts "\nIt's a tie!"
    $winner = "tie"
    endGame()
  else
    turn($turnNum)
  end
end
def formatNum1(x)
  x = x.to_s
  a = 2
  b = 3
  c = 4
  if x == "1"
    return a
  end
  if x == "2"
    return a
  end
  if x == "3"
    return a
  end
  if x == "4"
    return b
  end
  if x == "5"
    return b
  end
  if x == "6"
    return b
  end
  if x == "7"
    return c
  end
  if x == "8"
    return c
  end
  if x == "9"
    return c
  end
end
def formatNum2(y)
  y = y.to_s
  a = 1
  b = 2
  c = 3
  if y == "1"
    return a
  end
  if y == "2"
    return b
  end
  if y == "3"
    return c
  end
  if y == "4"
    return a
  end
  if y == "5"
    return b
  end
  if y == "6"
    return c
  end
  if y == "7"
    return a
  end
  if y == "8"
    return b
  end
  if y == "9"
    return c
  end
end
def tutorial()
  puts "Tic-Tac-Toe: A game of X's, O's, and (a little) strategy."
  puts "Grab a friend! It's a two player game."
  puts "____________________________"
  puts "OBJECTIVE"
  puts "To get 3 in a row in any direction of your respective symbol."
  puts "HOW TO PLAY (NORMAL RULES)"
  puts "Player 1 is assigned X and Player 2 is assigned O."
  puts "Player 1 marks an X anywhere on the board."
  puts "Now it is Player 2's turn. Player 2 marks an O anywhere on the board."
  puts "Play continued like this until either player gets 3 in a row in any direction of their respective symbol (X or O)."
  puts "HOW TO PLAY (COMMAND LINE)"
  puts "Normal rules apply, but instead of marking on a visible board, the players input a number."
  puts "This number determines the spot that a symbol will be marked."
  puts "For example, 1 would be the top-left corner."
  puts "2 would be the top-middle cell."
  puts "3 would be the top-right corner."
  puts "4 would be the middle-left cell."
  puts "5 would be the middle cell."
  puts "6 would be the middle-right cell."
  puts "7 would be the bottom-left corner."
  puts "8 would be the bottom-middle cell."
  puts "9 would be the bottom-right corner."
  puts "The game will notify you when one player wins."
  puts "You can keep track of the game on this google spreadsheet:"
  puts "https://docs.google.com/spreadsheets/d/13zeA2CQagu4xLwTuFrBoQSozv5jOY16xifq2EDHNf3s/edit?usp=sharing"
end
def startGame()
  $turnNum = 1
  def turn(n)
    puts "Player #{n}'s turn!"
    input = gets.chomp
    if input =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
      input = input.to_i
      if input <= 9
        if input >= 1
          input
        else
          puts "Input a number from 1-9, please."
          turn(n)
        end
      else
        puts "Input a number from 1-9, please."
        turn(n)
      end
    else
      puts "Input a number, please."
      turn(n)
    end
    if $turnNum == 1
      $ws[formatNum1(input),formatNum2(input)] = "X"
      $ws.save
    elsif $turnNum == 2
      $ws[formatNum1(input),formatNum2(input)] = "Y"
      $ws.save
    end
    if $turnNum == 1
      $turnNum = 2
    elsif $turnNum == 2
      $turnNum = 1
    end
    checkForWin2()
  end
  turn($turnNum)
end
def init()
  puts "You are about to play Tic-Tac-Toe, command-line version!"
  puts "Keep track of the game here:"
  puts "https://docs.google.com/spreadsheets/d/13zeA2CQagu4xLwTuFrBoQSozv5jOY16xifq2EDHNf3s/edit?usp=sharing"
  puts "Type \"begin\" to start the game."
  puts "Type \"tutorial\" to see a tutorial on how to play."
  puts "Type \"exit\" to stop the game."
  def ask()
    input = gets.chomp
    if input == "begin"
      puts "Input Player 1's username:"
      $ws[2,6] = gets.chomp
      $ws.save
      puts "Input Player 2's username:"
      $ws[2,7] = gets.chomp
      $ws.save
      puts "Starting game!\n"
      startGame()
    elsif input == "tutorial"
      tutorial()
      init()
    elsif input == "exit"
      puts "Closing game..."
    else
      puts "Sorry, I didn't get that."
      ask()
    end
  end
  ask()
end
def endGame()
  if $winner == 1
    $ws[2,8] = $ws[2,6]
    $ws.save
  elsif $winner == 2
    $ws[2,8] = $ws[2,7]
    $ws.save
  elsif $winner == "tie"
    $ws[2,8] = "TIE"
    $ws.save
  end
  row11 = $ws[2,1]
  row12 = $ws[2,2]
  row13 = $ws[2,3]
  row21 = $ws[3,1]
  row22 = $ws[3,2]
  row23 = $ws[3,3]
  row31 = $ws[4,1]
  row32 = $ws[4,2]
  row33 = $ws[4,3]
  recap = "#{row11},#{row12},#{row13},#{row21},#{row22},#{row23},#{row31},#{row32},#{row33}"
  $ws[2,9] = recap
  time = Time.new
  timeHRS = "#{time.hour}:#{time.min}"
  timeDATE = "#{time.strftime("%A")}, #{time.strftime("%B")} #{time.strftime("%d")}, #{time.strftime("%Y")}"
  $ws[2,4] = timeDATE
  $ws[2,5] = timeHRS
  $ws.save
  [1,2,3].each do |i|
    [2,3,4].each do |j|
      $ws[j,i] = nil
    end
  end
  [4,5,6,7,8,9].each do |i|
    $ws[2,i] = nil
  end
  $ws.save
  clearSheet()
end
def clearSheet()
  [1,2,3].each do |i|
    [2,3,4].each do |j|
      $ws[j,i] = nil
    end
  end
  [4,5,6,7,8,9].each do |i|
    $ws[2,i] = nil
  end
  $ws.save
end

init()
