require 'pry'

# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end
#-----------------Helper Method----------------------------
def get_players
  #keys will pull keys from the game_hash hash which are home and away
  #map takes those and creates a new array
  players = game_hash.keys.map do |team|
    #what is game_hash at a key of (home/away) and then what is in the players key
    game_hash[team][:players]
  end
  #flatten combines the hashes that are in players from both teams and puts them in to one array
  players.flatten
  
end
#----------------------Helper Method------------------------

def get_teams
  returned_teams = game_hash.keys.map do |teams|
    game_hash[teams][:team_name]
  end
  returned_teams.flatten
end

#----------------------Helper Method------------------------

def get_colors
  returned_colors = game_hash.values.map do |team_colors|
    team_colors[:colors]
    end
    returned_colors
  end
  
#----------------------Helper Method------------------------

def get_nums
nums = game_hash.values.map do |points|
  points[:numbers]
end
 nums
end

#----------------------Helper Method------------------------

def get_shoes
  returned_shoe = game_hash.keys.map do |teams|
    game_hash[teams]["Mason Plumlee"]
  end
  returned_teams
  binding.pry
end


#---------------------------------------------
def num_points_scored(player_name)
 found_player = get_players.find do |player|
   player[:player_name] == player_name
end
return found_player[:points]
end


#---------------------------------------------
def shoe_size(player_name)
found_player = get_players.find do |player|
  player[:player_name] == player_name
end
return found_player[:shoe]
end

#----------------------------------------------
def team_colors(team_name)
colors = get_colors
 if team_name == "Brooklyn Nets"
   return get_colors[0]
 end
 if team_name == "Charlotte Hornets"
   return get_colors[1]
 end
end

#----------------------------------------------
def team_names
  get_teams
end
#----------------------------------------------

def player_numbers(team_name)
numbers = []
  game_hash.each do |key,value|
    if value[:team_name] == team_name 
      value[:players].each do |num|
        numbers << num[:number]
    end
    end
  end
  numbers
end

#----------------------------------------------

def big_shoe_rebounds(player_name = "Mason Plumlee")
found_player = get_players.find do |player|
  player[:player_name] == player_name
end
return found_player[:rebounds]
end

#----------------------------------------------

def player_stats(player_name)
found_player = get_players.find do |player|
  player[:player_name] == player_name
end
return found_player
end

#------------------------------------------------



