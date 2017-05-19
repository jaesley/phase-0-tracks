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

def add_player(db, name, location)
  db.execute("INSERT INTO players (name, location) VALUES (?, ?)", [name, location])
end

def add_player_info(db)
  puts "Player's name:"
  name = gets.chomp
  puts "Player's location:"
  location = gets.chomp
  add_player(db, name, location)
end

def view_players(db)
  players = db.execute("SELECT * FROM players")
  players.each do |player|
    puts "#{player['id']}\t#{player['name']}\t\t#{player['location']}"
  end
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
  db.execute("INSERT INTO games (name, setting, genre, activity_status) VALUES (?, ?, ?, ?)", [name, setting, genre, activity_status])
end

def add_game_info(db)
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

def view_games(db)
  games = db.execute("SELECT * FROM games")
  games.each do |game|
    puts "#{game['id']}\t#{game['name']}\t\t#{game['setting']}\t\t#{game['genre']}\t\t#{game['activity_status']}"
  end
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

def add_character_info(db)
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

def view_characters(db)
  characters = db.execute("SELECT characters.id, characters.name, characters.template, games.name, players.name FROM characters, games, players WHERE games.id = characters.game_id AND players.id = characters.player_id;")
  characters.each do |character|
    puts "#{character[0]}\t#{character[1]}\t\t#{character[2]}\t#{character[3]}\t\t#{character[4]}"
  end
end

# 3. Driver Code / User Interface

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
          add_player_info(db)
        when "character"
          add_character_info(db)
        when "game"
          add_game_info(db)
        else
          puts "Please enter 'player', 'character', or 'game', or 'done' if complete."
      end
    when "view"
      puts "Would you like to view players, games, or characters?"
      action_type = gets.chomp.downcase
    when "edit"
      puts "Would you like to edit a player, a game, or a character?"
      action_type = gets.chomp.downcase
    else
      puts "Please enter 'view', 'add', or 'edit', or 'done' if complete."
  end
end