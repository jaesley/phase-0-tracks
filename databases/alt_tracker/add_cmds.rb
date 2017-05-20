Module Add_Cmds

# method add_player
#   get name
#   get location
#   add to players table
# end method

def add_player(db, name, location)
  db.execute("INSERT INTO players (name, location) VALUES (?, ?)", [name, location])
end

def get_player_info(db)
  puts "Player's name:"
  name = gets.chomp
  puts "Player's location (state if American, country otherwise):"
  location = gets.chomp
  add_player(db, name, location)
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
end