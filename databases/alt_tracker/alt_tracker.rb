# Objective:

# I do a lot of online tabletop gaming, which involves people from all over the world,
#   playing numerous persistant-world games, with a variety of characters on each game.
#   End result: I frequently run into a friend playing under a new character name, and
#   I realize that I know them and enjoy gaming with them... only to forget all that
#   and have to rediscover them over and over again. A stab at organizing that info
#   seemed like a good basis for a schema to practice my SQL + Ruby skills on.

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

# 2. Methods

# method add_player
#   get name
#   get location
#   add to players table
# end method

def make_bool(input)
  if input == "y"
    return true
  end
  return false
end

def add_player(db, name, location)
  db.execute("INSERT INTO players (name, location) VALUES (?, ?)", [name, location])
end

# method add_game
#   get name
#   get setting
#   get genre
#   get activity_status
#     convert to boolean
#   add to games table
# end method

def add_game(db, name, setting, genre, activity_status)
  db.execute("INSERT INTO games (name, setting, genre, activity_status) VALUES (?, ?, ?, ?", [name, setting, genre, activity_status])
end

# method add_character
#   get name
#   get template
#   show list of games
#   get game id
#   show list of players
#   get player id
# end method

def add_character(db, name, template, game_id, player_id)
  db.execute("INSERT INTO characters (name, template, game_id, player_id) VALUES (?, ?, ?, ?)", [name, template, game_id, player_id])
end

# 3. Driver Code / User Interface

loop do
  puts "Are you adding a player, a character, or a game? Enter 'done' if complete."
  table = gets.chomp.downcase
  break if table == "done"
  case table_type
    when "player"
      puts "Player's name:"
      name = gets.chomp
      puts "Player's location:"
      location = gets.chomp
      add_player(db, name, location)
    when "character"
      add_character
    when "game"
      puts "Game's name:"
      name = gets.chomp
      puts "Game's setting:"
      setting = gets.chomp
      puts "Game's genre:"
      genre = gets.chomp
      puts "Game's current activity status (y/n):"
      activity_status = gets.chomp
      add_game(db, name, setting, genre, activity_status)
    else
      "Please enter 'player', 'character', or 'game', or 'done' if complete."
  end
end