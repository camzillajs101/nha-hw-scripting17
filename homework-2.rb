=begin
  Assignment #2, Tic-Tac-Toe
=end

require 'google_drive'

def initDrive()
  session = GoogleDrive::Session.from_config("homework-2_config.json")
  wsAll = session.spreadsheet_by_key("13zeA2CQagu4xLwTuFrBoQSozv5jOY16xifq2EDHNf3s").worksheets[0]
  wsTemp = session.spreadsheet_by_key("1Gp3oEDkaPyrOdNuKmmjD7Zcsnw_E5lO7D-lGC5NgyF4").worksheets[0]
end
def checkForWin(xy)
  session = GoogleDrive::Session.from_config("homework-2_config.json")
  wsTemp = session.spreadsheet_by_key("1Gp3oEDkaPyrOdNuKmmjD7Zcsnw_E5lO7D-lGC5NgyF4").worksheets[0]
  row1 = [wsTemp[2,1],wsTemp[2,2],wsTemp[2,3]]
  row2 = [wsTemp[3,1],wsTemp[3,2],wsTemp[3,3]]
  row3 = [wsTemp[4,1],wsTemp[4,2],wsTemp[4,3]]
  column1 = [wsTemp[2,1],wsTemp[3,1],wsTemp[4,1]]
  column2 = [wsTemp[2,2],wsTemp[3,2],wsTemp[4,2]]
  column3 = [wsTemp[2,3],wsTemp[3,3],wsTemp[4,3]]
  if xy == "x"
    found = false
    if row1[0] == "X"
      if row1[1] == "X"
        if row1[2] == "X"
          found = true
        end
      end
    end
    if row2[0] == "X"
      if row2[1] == "X"
        if row2[2] == "X"
          found = true
        end
      end
    end
    if row3[0] == "X"
      if row3[1] == "X"
        if row3[2] == "X"
          found = true
        end
      end
    end
    if column1[0] == "X"
      if column1[1] == "X"
        if column1[2] == "X"
          found = true
        end
      end
    end
    if column2[0] == "X"
      if column2[1] == "X"
        if column2[2] == "X"
          found = true
        end
      end
    end
    if column3[0] == "X"
      if column3[1] == "X"
        if column3[2] == "X"
          found = true
        end
      end
    end
    if row1[0] == "X"
      if row2[1] == "X"
        if row3[2] == "X"
          found = true
        end
      end
    end
    if row1[2] == "X"
      if row2[1] == "X"
        if row3[0] == "X"
          found = true
        end
      end
    end
    found
  end
  if xy == "y"
    found = false
    if row1[0] == "Y"
      if row1[1] == "Y"
        if row1[2] == "Y"
          found = true
        end
      end
    end
    if row2[0] == "Y"
      if row2[1] == "Y"
        if row2[2] == "Y"
          found = true
        end
      end
    end
    if row3[0] == "Y"
      if row3[1] == "Y"
        if row3[2] == "Y"
          found = true
        end
      end
    end
    if column1[0] == "Y"
      if column1[1] == "Y"
        if column1[2] == "Y"
          found = true
        end
      end
    end
    if column2[0] == "Y"
      if column2[1] == "Y"
        if column2[2] == "Y"
          found = true
        end
      end
    end
    if column3[0] == "Y"
      if column3[1] == "Y"
        if column3[2] == "Y"
          found = true
        end
      end
    end
    if row1[0] == "Y"
      if row2[1] == "Y"
        if row3[2] == "Y"
          found = true
        end
      end
    end
    if row1[2] == "Y"
      if row2[1] == "Y"
        if row3[0] == "Y"
          found = true
        end
      end
    end
    found
  end
end
def formatNum(x)
  if x == 1
    [2,1]
  end
  if x == 2
    [2,2]
  end
  if x == 3
    [2,3]
  end
  if x == 4
    [3,1]
  end
  if x == 5
    [3,2]
  end
  if x == 6
    [3,3]
  end
  if x == 7
    [4,1]
  end
  if x == 8
    [4,2]
  end
  if x == 9
    [4,3]
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
  puts "https://docs.google.com/a/ps10.org/spreadsheets/d/1Gp3oEDkaPyrOdNuKmmjD7Zcsnw_E5lO7D-lGC5NgyF4/edit?usp=sharing"
end
def startGame()
  turnNum = 1
  def checkForWin2()
    if checkForWin("x") == true
      puts "Player 1 wins!"
      initDrive()
      wsTemp[2,8] = wsTemp[2,6]
      wsTemp.save
    elsif checkForWin("y") == true
      puts "Player 2 wins!"
      initDrive()
      wsTemp[2,8] = wsTemp[2,7]
      wsTemp.save
    else
      turn(turnNum)
    end
  end
  def turn(n)
    puts "Player #{n}'s turn!"
    input = gets.chomp
    if input =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
      input = input.to_f
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
    session = GoogleDrive::Session.from_config("homework-2_config.json")
    wsAll = session.spreadsheet_by_key("13zeA2CQagu4xLwTuFrBoQSozv5jOY16xifq2EDHNf3s").worksheets[0]
    wsTemp = session.spreadsheet_by_key("1Gp3oEDkaPyrOdNuKmmjD7Zcsnw_E5lO7D-lGC5NgyF4").worksheets[0]
    wsTemp[formatNum(input)] = "X"
    if turnNum == 1
      turnNum = 2
    elsif turnNum == 2
      turnNum = 1
    end
    checkForWin2()
  end
  turn(turnNum)
end
def init()
  puts "You are about to play Tic-Tac-Toe, command-line version!"
  puts "Type \"begin\" to start the game."
  puts "Type \"tutorial\" to see a tutorial on how to play."
  def ask()
    input = gets.chomp
    if input == "begin"
      puts "Input Player 1's username:"
      session = GoogleDrive::Session.from_config("homework-2_config.json")
      wsAll = session.spreadsheet_by_key("13zeA2CQagu4xLwTuFrBoQSozv5jOY16xifq2EDHNf3s").worksheets[0]
      wsTemp = session.spreadsheet_by_key("1Gp3oEDkaPyrOdNuKmmjD7Zcsnw_E5lO7D-lGC5NgyF4").worksheets[0]
      wsTemp[2,6] = gets.chomp
      wsTemp.save
      puts "Input Player 2's username:"
      wsTemp[2,7] = gets.chomp
      wsTemp.save
      puts "Starting game!"
      puts ""
      startGame()
    elsif input == "tutorial"
      tutorial()
      init()
    else
      puts "Sorry, I didn't get that."
      ask()
    end
  end
  ask()
end
def endGame()

end
init()
