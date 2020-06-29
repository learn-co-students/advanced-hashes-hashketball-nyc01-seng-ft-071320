# Write your code below game_hash
require "pry"

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

# Write code here

def num_points_scored(player)
  answer = ""
  game_hash.each do |team, team_details|
    team_details[:players].each do |element|
      if element[:player_name] == player
        answer = element[:points]
        return answer
      end
    end
  end
end

def shoe_size(player)
  keys = game_hash.keys
  count = 0
  while count < 2 do
    count2 = 0
    while count2 < 5 do
      if game_hash[keys[count]][:players][count2][:player_name] == player
        return game_hash[keys[count]][:players][count2][:shoe]
      end
    count2 += 1
    end
  count += 1
  end
end

def team_colors(name)
  keys = game_hash.keys
  count = 0
  while count < 2 do
    if game_hash[keys[count]][:team_name] == name
      return game_hash[keys[count]][:colors]
    end
  count += 1
  end
end

def team_names
  names = []
  keys = game_hash.keys
  keys.each do |team|
    names << game_hash[team][:team_name]
  end
  return names
end

def player_numbers(team_name)
  numbers = []
  keys = game_hash.keys
  keys.each do |team|
    if game_hash[team][:team_name] == team_name
      count = 0
      while count < 5 do
        numbers << game_hash[team][:players][count][:number]
        count += 1
      end
    end
  end
  return numbers
end

def player_stats(player)
  answer = ""
  game_hash.each do |team, team_details|
    team_details[:players].each do |element|
      if element[:player_name] == player
        answer = element
        return answer
      end
    end
  end
end

def big_shoe_rebounds
  max_value = 0
  biggest_shoe_name = ""
  home_away = ""
  i = ""
  game_hash.each do |team, team_value|
    team_value[:players].each do |element|
      if element[:shoe] > max_value
        max_value = element[:shoe]
        biggest_shoe_name = element[:player_name]
        home_away = team
        i = team_value[:players].index(element)
      end
    end
  end
  return game_hash[home_away][:players][i][:rebounds]
end

def most_points_scored
  max_points = 0
  answer = ""
  game_hash.each do |team, team_stats|
    team_stats[:players].each do |element|
      if element[:points] > max_points
        max_points = element[:points]
        answer = element[:player_name]
      end
    end
  end
  return answer
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash.each do |team, team_stats|
    team_stats[:players].each do |element|
      if team == :home
        home_points = home_points + element[:points]
      elsif team == :away
        away_points = away_points + element[:points]
      end
    end
  end
  if home_points > away_points
    return game_hash[:home][:team_name]
  elsif home_points < away_points
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  name_length = 0
  player_name = ""
  game_hash.each do |team, team_stats|
    team_stats[:players].each do |element|
      if element[:player_name].length > name_length
        name_length = element[:player_name].length
        player_name = element[:player_name]
      end
    end
  end
  return player_name
end

def long_name_steals_a_ton?
  max_steals = 0
  name = ""
  game_hash.each do |team, team_stats|
    team_stats[:players].each do |element|
      if element[:steals] > max_steals
        max_steals = element[:steals]
        name = element[:player_name]
      end
    end
  end
  if name == player_with_longest_name
    return true
  else
    return false
  end
end
