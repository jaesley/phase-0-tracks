# Can I refactor into a Game_DB class, using modules for adding, viewing, and editing,
# in order to streamline this file? 

# Objective:

# I do a lot of online tabletop gaming, which involves people from all over the world,
#   playing numerous persistant-world games, with a variety of characters on each game.
#   End result: I frequently run into a friend playing under a new character name, and
#   I realize that I know them and enjoy gaming with them... only to forget all that
#   and have to rediscover them over and over again. A stab at organizing that info
#   seemed like a good basis for a schema to practice my SQL + Ruby skills on.

require 'sqlite3'
require_relative 'game_db'

# create database
# create tables: players, games, characters
# add data to each table
# retrieve data?

# 1. Database Generation

require 'sqlite3'

db = SQLite3::Database.new("alts.db")
db.results_as_hash = true

cmd_create_table_players = <<-SQL
  CREATE TABLE IF NOT EXISTS players (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(255)
    )
  SQL

cmd_create_table_games = <<-SQL
  CREATE TABLE IF NOT EXISTS games (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    setting VARCHAR(255),
    genre VARCHAR(255),
    activity_status BOOLEAN
  )
  SQL

cmd_create_table_characters = <<-SQL
  CREATE TABLE IF NOT EXISTS characters (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    template VARCHAR(255),
    game_id INTEGER,
    player_id INTEGER,
    FOREIGN KEY (game_id) REFERENCES games(id),
    FOREIGN KEY (player_id) REFERENCES players(id)
  )
  SQL

db.execute(cmd_create_table_players)
db.execute(cmd_create_table_games)
db.execute(cmd_create_table_characters)

# method add_player
#   get name
#   get location
#   add to players table
# end method


def get_player_info(db)
  puts "Player's name:"
  name = gets.chomp
  puts "Player's location (state if American, country otherwise):"
  location = gets.chomp
  add_player(db, name, location)
end

def get_game_info(db)
  puts "Game's name:"
  name = gets.chomp
  puts "Game's setting:"
  setting = gets.chomp
  puts "Game's genre:"
  genre = gets.chomp
  puts "Game's current activity status (true/false):"
  activity_status = gets.chomp
  add_game(db, name, setting, genre, activity_status)
end

def get_character_info(db)
  puts "Character's name:"
  name = gets.chomp
  puts "Character's template:"
  template = gets.chomp
  puts "Game's ID number:"
  view_games(db)
  game_id = gets.chomp
  puts "Player's ID number:"
  view_players(db)
  player_id = gets.chomp
  add_character(db, name, template, game_id, player_id)
end

def add_player(db, name, location)
  db.execute("INSERT INTO players (name, location) VALUES (?, ?)", [name, location])
end

def add_game(db, name, setting, genre, activity_status)
  db.execute("INSERT INTO games (name, setting, genre, activity_status) VALUES (?, ?, ?, ?)", [name, setting, genre, activity_status])
end

def add_character(db, name, template, game_id, player_id)
  db.execute("INSERT INTO characters (name, template, game_id, player_id) VALUES (?, ?, ?, ?)", [name, template, game_id, player_id])
end

# to view db rows:
# store view options as hash key, sql query as VALUES
#   index as key, value is array of option + sql query?
#     will have to make individual cmds for each output
#     array should be printed text + cmd name
#     then can run cmd via array index
# select the number to retrieve the value for that key

def view_options(db)
  options = {}
  options[1] = ["View all players.", "view_players(db)"]
  # options[2] = ["View all games.", view_games(db)]
  # options[3] = ["View all characters.", view_characters(db)]
  # options[5] = ["View all active games.", view_games_active(db)]
  # options[6] = ["View all games in a genre", view_games_genre(db)]
  # options[7] = ["View all characters played by a player.", view_characters_player(db)]
  # options[8] = ["View all characters on a game.", view_characters_game(db)]
  # options[9] = ["View all characters played by a player on a game.", view_characters_player_game(db)]

  options.each do | index, option |
    puts "#{index}. #{option[0]}"
  end

  view = gets.chomp.to_i
  options[view][1]
  # It runs the cmd text when adding to hash. How to make it add it as text
  # and then run the command by calling it later by hash?
end

def view_players(db)
  players = db.execute("SELECT * FROM players")
  players.each do |player|
    puts "#{player['id']}\t#{player['name']}\t\t#{player['location']}"
  end
end

def view_games(db)
  games = db.execute("SELECT * FROM games")
  games.each do |game|
    puts "#{game['id']}\t#{game['name']}\t#{game['setting']}\t#{game['genre']}\t#{game['activity_status']}"
  end
end

def view_characters(db)
  characters = db.execute("SELECT characters.id, characters.name, characters.template, games.name, players.name FROM characters, games, players WHERE games.id = characters.game_id AND players.id = characters.player_id;")
  characters.each do |character|
    puts "#{character[0]}\t#{character[1]}\t#{character[2]}\t#{character[3]}\t#{character[4]}"
  end
end

# Driver Code / User Interface

# start loop
#   view, add, or edit?
#   break if done
#   if add:
#     add player, character, or game?
#     if player:
#       add_player
#     else if game
#       add_game
#     else if character
#       add character
#     else
#       error message
#     end if
#   end if
#   else if edit:
#     edit player, character, or game?
#     if player
#       view players
#       select number
#       update player
#     else if game
#       view games
#       select number
#       update game
#     else if character
#       view characters
#       select number
#       update character
#     else
#       error message
#     end if
#   else view
#     if players
#       view players
#     else if games
#       view games
#     else if characters
#       view characters
#     else
#       error message
#     end if
#   end if
# end loop

loop do
  puts "Would you like to view, add, or edit information? Enter 'done' if complete."
  action_type = gets.chomp.downcase
  break if action_type == "done"
  case action_type
    when "add"
      puts "Are you adding a player, a character, or a game?"
      action_type = gets.chomp.downcase
      case action_type
        when "player"
          get_player_info(db)
        when "character"
          get_character_info(db)
        when "game"
          get_game_info(db)
        else
          puts "Please enter 'player', 'character', or 'game', or 'done' if complete."
      end
    when "view"
      puts "Below are some of the most useful ways to view information. Enter the number of the option you would like."
      view_options(db)
    when "edit"
      puts "Would you like to edit a player, a game, or a character?"
      action_type = gets.chomp.downcase
      case action_type
        when "player"
          edit_player_info(db)
        when "character"
          edit_character_info(db)
        when "game"
          edit_game_info(db)
        else
          puts "Please enter 'player', 'character', or 'game', or 'done' if complete."
      end
    else
      puts "Please enter 'view', 'add', or 'edit', or 'done' if complete."
  end
end