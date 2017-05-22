# Objective:

# I do a lot of online tabletop gaming, which involves people from all over the world,
#   playing numerous persistant-world games, with a variety of characters on each game.
#   End result: I frequently run into a friend playing under a new character name, and
#   I realize that I know them and enjoy gaming with them... only to forget all that
#   and have to rediscover them over and over again. A stab at organizing that info
#   seemed like a good basis for a schema to practice my SQL + Ruby skills on, and
#   it can be expanded over time as I find old friends in new guises!

require 'sqlite3'

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

# 2. Commands to Add Info

def get_player_info(db)
  puts "\nPlayer's name:"
  name = gets.chomp
  puts "\nPlayer's location (state if American, country otherwise):"
  location = gets.chomp
  add_player(db, name, location)
end

def add_player(db, name, location)
  db.execute("INSERT INTO players (name, location) VALUES (?, ?)", [name, location])
end

def get_game_info(db)
  puts "\nGame's name:"
  name = gets.chomp
  puts "\nGame's setting:"
  setting = gets.chomp
  puts "\nGame's genre:"
  genre = gets.chomp
  puts "\nGame's current activity status (true/false):"
  activity_status = gets.chomp
  add_game(db, name, setting, genre, activity_status)
end

def add_game(db, name, setting, genre, activity_status)
  db.execute("INSERT INTO games (name, setting, genre, activity_status) VALUES (?, ?, ?, ?)", [name, setting, genre, activity_status])
end

def get_character_info(db)
  puts "\nCharacter's name:"
  name = gets.chomp
  puts "\nCharacter's template:"
  template = gets.chomp
  puts "\nGame's ID number:"
  view_games(db)
  game_id = gets.chomp
  puts "\nPlayer's ID number:"
  view_players(db)
  player_id = gets.chomp
  add_character(db, name, template, game_id, player_id)
end

def add_character(db, name, template, game_id, player_id)
  db.execute("INSERT INTO characters (name, template, game_id, player_id) VALUES (?, ?, ?, ?)", [name, template, game_id, player_id])
end

# 3. Commands to View Info

def view_options(db)
  options = {}
  options[1] = "View all players."
  options[2] = "View all games."
  options[3] = "View all characters."
  options[4] = "View all players in a location."
  options[5] = "View all active games."
  options[6] = "View all games in a genre"
  options[7] = "View all characters played by a player."
  options[8] = "View all characters on a game."
  options[9] = "View all characters played by a player on a game."

  options.each do | index, option |
    puts "#{index}. #{option}"
  end

  id = gets.chomp.to_i

  case id
  when 1
    view_players(db)
  when 2
    view_games(db)
  when 3
    view_characters(db)
  when 4
    puts "\nWhat location would you like to see all players from? (state for Americans, country otherwise)"
    location = gets.chomp
    view_players_location(db, location)
  when 5
    view_games_active(db)
  when 6
    puts "\nWhat genre would you like to view?"
    genre = gets.chomp
    view_games_genre(db, genre)
  when 7
    puts "\nWhich player's characters would you like to view?"
    view_players(db)
    id = gets.chomp
    view_characters_player(db, id)
  when 8
    puts "\nWhich game's characters would you like to view?"
    view_games(db)
    id = gets.chomp
    view_characters_game(db, id)
  when 9
    puts "\nWhich player's characters would you like to view?"
    view_players(db)
    player_id = gets.chomp
    puts "\nWhich game's characters would you like to view?"
    view_games(db)
    game_id = gets.chomp
    view_characters_player_game(db, player_id, game_id)
  else
    "\nEnter the number of the view you would like."
  end
end

def view_player_template(players)
  puts "\n" + "ID".ljust(3) + "Name".ljust(20) + "Location"
  players.each do |player|
    puts player['id'].to_s.ljust(3) + player['name'].ljust(20) + player['location']
  end
  puts
end

def view_game_template(games)
  puts "\n" + "ID".ljust(3) + "Name".ljust(25) + "Setting".ljust(15) + "Genre".ljust(25) + "Active?"
  games.each do |game|
    puts game['id'].to_s.ljust(3) + game['name'].ljust(25) + game['setting'].ljust(15) + game['genre'].ljust(25) + game['activity_status']
  end
  puts
end

def view_character_template(characters)
  puts "\n" + "ID".ljust(3) + "Name".ljust(20) + "Template".ljust(15) + "Game".ljust(25) + "Player"
  characters.each do |character|
    puts character[0].to_s.ljust(3) + character[1].ljust(20) + character[2].ljust(15) + character[3].to_s.ljust(25) + character[4].to_s
  end
  puts 
end

def view_players(db)
  players = db.execute("SELECT * FROM players")
  view_player_template(players)
end

def view_games(db)
  games = db.execute("SELECT * FROM games")
  view_game_template(games)
end

def view_characters(db)
  characters = db.execute("SELECT characters.id, characters.name, characters.template, games.name, players.name FROM characters, games, players WHERE games.id = characters.game_id AND players.id = characters.player_id")
  view_character_template(characters)
end

def view_players_location(db, location)
  players = db.execute("SELECT * FROM players WHERE location = \"#{location}\"")
  view_player_template(players)
end

def view_games_active(db)
  games = db.execute("SELECT * FROM games WHERE activity_status = \"true\"")
  view_game_template(games)
end

def view_games_genre(db, genre)
  games = db.execute("SELECT * FROM games WHERE genre = \"#{genre}\"")
  view_game_template(games)
end

def view_characters_player(db, id)
  characters = db.execute("SELECT characters.id, characters.name, characters.template, games.name, players.name FROM characters, games, players WHERE games.id = characters.game_id AND players.id = characters.player_id AND characters.player_id = #{id}")
  view_character_template(characters)
end

def view_characters_game(db, id)
  characters = db.execute("SELECT characters.id, characters.name, characters.template, games.name, players.name FROM characters, games, players WHERE games.id = characters.game_id AND players.id = characters.player_id AND characters.game_id = #{id}")
  view_character_template(characters)
end

def view_characters_player_game(db, player_id, game_id)
  characters = db.execute("SELECT characters.id, characters.name, characters.template, games.name, players.name FROM characters, games, players WHERE games.id = characters.game_id AND players.id = characters.player_id AND characters.player_id = #{player_id} AND characters.game_id = #{game_id}")
  view_character_template(characters)
end

# 4. Commands to Edit Info

def edit_player_info(db)
  puts "\nEnter the number of the player you would like to edit."
  view_players(db)
  id = gets.chomp
  puts "\nWould you like to update name or location?"
  field = gets.chomp.downcase
  puts "\nWhat is the updated #{field}?"
  correction = gets.chomp
  db.execute("UPDATE players SET #{field} = \"#{correction}\" WHERE id = #{id}")
end

def edit_game_info(db)
  puts "\nEnter the number of the game you would like to edit."
  view_games(db)
  id = gets.chomp
  puts "\nWould you like to update name, setting, genre, or activity_status?"
  field = gets.chomp.downcase
  puts "\nWhat is the updated #{field}?"
  correction = gets.chomp
  db.execute("UPDATE games SET #{field} = \"#{correction}\" WHERE id = #{id}")
end

def edit_character_info(db)
  puts "\nEnter the number of the character you would like to edit."
  view_characters(db)
  id = gets.chomp
  puts "\nWould you like to update name, template, game_id, or player_id?"
  field = gets.chomp.downcase
  puts "\nWhat is the updated #{field}?"
  if field == "game_id" 
    view_games
  elsif field == "player_id"
    view_players
  end
  correction = gets.chomp
  db.execute("UPDATE characters SET #{field} = \"#{correction}\" WHERE id = #{id}")
end

# 5. Driver Code / User Interface

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
  puts "\nWould you like to view, add, or edit information? Enter 'done' if complete."
  action_type = gets.chomp.downcase
  break if action_type == "done"
  case action_type
    when "add"
      puts "\nAre you adding a player, a character, or a game?"
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
      puts "\nBelow are some of the most useful ways to view information. Enter the number of the option you would like."
      view_options(db)
    when "edit"
      puts "\nWould you like to edit a player, a game, or a character?"
      action_type = gets.chomp.downcase
      case action_type
        when "player"
          edit_player_info(db)
        when "character"
          edit_character_info(db)
        when "game"
          edit_game_info(db)
        else
          puts "\nPlease enter 'player', 'character', or 'game', or 'done' if complete."
      end
    else
      puts "\nPlease enter 'view', 'add', or 'edit', or 'done' if complete."
  end
end