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

# Write code here

def num_points_scored(player)
  #helper method
  find_stats(player, :points)
end

def shoe_size(player)
  #helper method
  find_stats(player, :shoe)
end

def team_colors(team_name)
  stats = game_hash
  stats.each do |key, value|
    if(value[:team_name] == team_name)
      return value[:colors]
    end
  end
end
  
def team_names
  stats = game_hash
  teams = []
  stats.each do |key, value|
    teams << value[:team_name]
  end
  teams
end

def player_numbers(team)
  stats = game_hash
  numbers = []
  results = stats.each do |key, value|
    if(value[:team_name] == team)
      value[:players].each do |player|
        numbers << player[:number]
       end
    end
  end
  numbers
end

def most_points_scored
  results = []
  game_hash.each do |key, value|
    results << value[:players]     
  end
  flatten_players = results.flatten
  most_points = flatten_players[0]
  flatten_players.each do |stats|
    if(stats[:points] > most_points[:points])
      most_points = stats
    end
  end
 most_points[:player_name]   
end

def winning_team
  winner = {:team => nil, :total_points => 0}
  game_hash.each do |key, value|
    score = 0
    team = value[:team_name]
    value[:players].each do |name|
      score+= name[:points]
    end
    if(score > winner[:total_points])
      winner[:total_points] = score
      winner[:team] = team
    end
  end
  winner
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |key, value|
    value[:players].each do |name|
      if(longest_name.length < name[:player_name].length)
        longest_name = name[:player_name]
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = {:steals => 0}
  longest_name = player_with_longest_name
  game_hash.each do |key, value|
    value[:players].each do |stats|
      if(stats[:steals] > most_steals[:steals])
        most_steals = stats
      end
    end
  end
  most_steals[:player_name] == longest_name
end

def player_stats(player)
  #helper method
  find_stats(player)
end

def big_shoe_rebounds
  stats = game_hash
  biggest_foot = {:foot => 0, :rebounds => 0}
  stats.each do |key, value|
    value[:players].each do |name|
      if(name[:shoe] > biggest_foot[:foot])
        biggest_foot[:foot] = name[:shoe]
        biggest_foot[:rebounds] = name[:rebounds]
    end
    end
  end
  biggest_foot[:rebounds]
end

def find_stats(player, stat = nil)
  stats = game_hash
  complete_stats = []
  stats.each do |key, value|
    value[:players].each do |name|
      if(name[:player_name] == player)
        if(stat != nil)
          return name[stat]
        else
          return name
        end
      end
    end
  end
end
  
  
####### BONUS/ SUPER BONUS QUESTIONS ###########
puts most_points_scored
  
puts winning_team

puts player_with_longest_name

puts long_name_steals_a_ton?






