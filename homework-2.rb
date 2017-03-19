=begin
  Assignment #2, Tic-Tac-Toe
=end

require 'google_drive'

session = GoogleDrive::Session.from_config("homework-2_config.json")
ws = session.spreadsheet_by_key("13zeA2CQagu4xLwTuFrBoQSozv5jOY16xifq2EDHNf3s").worksheets[0]

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
  puts "Normal rules apply, but instead of marking on a visible board, the players input a coordinate (X,Y)."
  puts "The game will notify you when one player wins."
  puts "You can keep track of the game on this google spreadsheet:"
  puts "https://docs.google.com/a/ps10.org/spreadsheets/d/1Gp3oEDkaPyrOdNuKmmjD7Zcsnw_E5lO7D-lGC5NgyF4/edit?usp=sharing"
end
def init()
  puts "You are about to play Tic-Tac-Toe, command-line version!"
  puts "Type \"begin\" to start the game."
  puts "Type \"tutorial\" to see a tutorial on how to play."
  def ask()
    input = gets.chomp
    if input == "begin"
      puts "Ready!"
    else if input == tutorial
      tutorial()
      init()
    else
      puts "Sorry, I didn't get that."
      ask()
    end
  end
  ask()
end
init()
