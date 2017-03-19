=begin
  Assignment #2, Tic-Tac-Toe
=end

require 'google_drive'

session = GoogleDrive::Session.from_config("homework-2_config.json")
ws = session.spreadsheet_by_key("13zeA2CQagu4xLwTuFrBoQSozv5jOY16xifq2EDHNf3s").worksheets[0]
