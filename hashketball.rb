# Write your code below game_hash
require 'pry'

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

def all_players_merged
  game_hash[:home][:players].concat(game_hash[:away][:players])
end

def num_points_scored (player_arg)
  points = -1 
  all_players_merged.each do |player|
    if player[:player_name] == player_arg
     points = player[:points]
    end
  end  
  points
end

def shoe_size (player_arg)
  shoe_size = 0  
  all_players_merged.each do |player|
    if player[:player_name] == player_arg
     shoe_size = player[:shoe]
    end
  end  
  shoe_size
end

def team_colors(team_name)
  team_colors = []
  game_hash.each do |key, value|
    if value[:team_name] == team_name
      team_colors = value[:colors]
     # binding.pry 
    end  
  end  
  team_colors
end

def team_names
  team_names = game_hash[:home][:team_name] + "  " + game_hash[:away][:team_name]
  team_names.split("  ")
  #binding.pry
end

def player_numbers(team_name_arg)
  players_numbers_array = []
  case team_name_arg
  when game_hash[:home][:team_name]
    game_hash[:home][:players].map do |key, value|
      players_numbers_array << key[:number]
    end
  when game_hash[:away][:team_name]  
    game_hash[:away][:players].map do |key, value|
      players_numbers_array << key[:number]
    end
  end
  players_numbers_array
end

def player_stats (player_name_arg)
  final_hash = {}
  all_players_merged.each do |key, value|
    if key[:player_name] == player_name_arg
      final_hash = key
    end  
  end
  final_hash
end

def big_shoe_rebounds
  rebound = 0 
  biggest_shoe_size = all_players_merged.each_with_object([]) {|key, a| a << key[:shoe]}
  all_players_merged.each do |key|
    if key[:shoe] == biggest_shoe_size.max
      rebound = key[:rebounds]
      # binding.pry 
    end  
  end
  rebound
end

