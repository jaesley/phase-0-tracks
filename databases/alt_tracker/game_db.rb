

# create database
# create tables: players, games, characters
# add data to each table
# retrieve data?

# 1. Database Generation

require 'sqlite3'
require_relative 'add_cmds'
require_relative 'edit_cmds'
require_relative 'view_cmds'

class Game_db
  include Add_cmds
  include View_cmds
  # include Edit_cmds
  attr_accessor :db

  def initialize(db_name) # sets up the db/tables
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
  end
end