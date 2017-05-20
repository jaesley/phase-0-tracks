# Can I refactor into a Game_DB class, using modules for adding, viewing, and editing,
# in order to streamline this file? 

# Objective:

# I do a lot of online tabletop gaming, which involves people from all over the world,
#   playing numerous persistant-world games, with a variety of characters on each game.
#   End result: I frequently run into a friend playing under a new character name, and
#   I realize that I know them and enjoy gaming with them... only to forget all that
#   and have to rediscover them over and over again. A stab at organizing that info
#   seemed like a good basis for a schema to practice my SQL + Ruby skills on.

# I'm not confident that my program organization is optimal, but I decided that breaking
#   it down like this would be a good way to practice some skills I haven't used as much, 
#   like modules, and integrating a lot of different concepts together. I'm nothing if not
#   overambitious!

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

require_relative 'game_db'

db = Game_DB.new("alts.db")

# will have to update cmds to act as methods on Game_DB instance
# do I need the (db) param on every cmd if I revamp into a class?

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