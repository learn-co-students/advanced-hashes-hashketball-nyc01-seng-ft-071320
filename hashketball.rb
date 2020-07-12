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

def player_stats(name)
  game_hash.each_value { |team|
    team[:players].each { |player|
      return player if player[:player_name] == name
    }
  }
  nil
end

def num_points_scored(name)
  player_stats(name)[:points]
end

def shoe_size(name)
  player_stats(name)[:shoe]
end

def team_colors(name)
  game_hash.each_value { |team|
    return team[:colors] if team[:team_name] == name
  }
  nil
end

def team_names
  list = []
  game_hash.each_value { |team|
    list << team[:team_name] if team[:team_name]
  }
  list
end

def player_numbers(name)
  numbers = []
  game_hash.each_value { |team|
    if team[:team_name] == name
      team[:players].each { |player|
        numbers << player[:number]      
      }
    end
  }
  numbers
end

def biggest_num(data_to_compare, data_to_return)
  biggest = 0
  result = nil
  
  game_hash.each_value { |team|
    team[:players].each { |player|
      if player[data_to_compare] > biggest
        biggest = player[data_to_compare]
        result = player[data_to_return]
      end
    }
  }
  result
end

def big_shoe_rebounds
  biggest_num(:shoe, :rebounds)
end

def most_points_scored
  biggest_num(:points, :player_name)
end

def winning_team
  biggest = 0
  winning_team = ""
  
  game_hash.each_value { |team|
  
    points = team[:players].inject(0) { |sum, player|
      sum + player[:points]    
    }
    
    if points > biggest
      biggest = points
      winning_team = team[:team_name]
    end
  }
  
  winning_team
end

def player_with_longest_name
  longest_names = []
  game_hash.each_value { |team| 
  longest_names << team[:players].max_by { |player|
        player[:player_name].length
      }[:player_name]
  }
  longest_names.max { |name1, name2|
    name1.length <=> name2.length    
  }
end

def longest_name_steals_a_ton?
  player_with_longest_name == biggest_num(:steals, :player_name) ? true : false
end

# binding.pry