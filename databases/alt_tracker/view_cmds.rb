require 'sqlite3'

module View_cmds

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
end