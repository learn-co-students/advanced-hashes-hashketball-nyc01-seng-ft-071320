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

# game_home = game_hash[:home]
# game_away = game_hash[:away]

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name  && data == team
        return game_hash[location][:colors]
      end
    end
  end
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team)
  jersey = []

  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |num|
            jersey << num[:number]
          end
        end
      end
    end
  end
  jersey
end

def player_stats(player_name)
  player_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            player_hash = player
          end
        end
      end
    end
  end
  player_hash
end

def big_shoe_rebounds
  big_shoe = 0
  rebound_num = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:shoe] > big_shoe
            big_shoe = player[:shoe]
            rebound_num = player[:rebounds]
          end
        end
      end
    end
  end
  rebound_num
end

# !!!!!!BONUS QUESTIONS!!!!!!

# This code is super wet, but my brain was mush at this point.

def most_points_scored
  most_points = 0
  most_player = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:points] > most_points
            most_points = player[:points]
            most_player = player[:player_name]
          end
        end
      end
    end
  end
  most_player
end

def winning_team
  home_points = 0
  away_points = 0
  winner = ""
  game_hash.each do |location, team_data|
    if location == :home
      team_data[:players].each do |data|
        home_points += data[:points]
      end
    end
    if location == :away
      team_data[:players].each do |data|
        away_points += data[:points]
      end
    end
    if home_points > away_points
      winner = game_hash[:home][:team_name]
    else
      winner = game_hash[:away][:team_name]
    end
  end
  winner
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name|
          if name[:player_name].length > longest_name.length
            longest_name = name[:player_name]
          end
        end
      end
    end
  end
  longest_name
end

# !!!!!SUPER BONUS QUEST!!!!

def long_name_steals_a_ton
  longest_name = ""
  most_steals = 0
  is_this_right = false
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |stat|
          if stat[:player_name].length > longest_name.length
            longest_name = name[:player_name]
          end
          if stat[:steals] > most_steals
            most_steals = name[:steals]
          end
          # This is as far as I could get after awhile.  I think if I
          # dried up the code and found a way to compare stats, that would
          # be best.  But, I'm done.  Need a break.
        end
      end
    end
  end
end
