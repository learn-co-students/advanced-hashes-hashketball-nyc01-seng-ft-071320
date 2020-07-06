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

def players 
x = game_hash[:home][:players] + (game_hash[:away][:players])
x
end

def num_points_scored(player_search) 
 game_hash.each do |team,team_info|
   team_info[:players].each do |player|
     if player[:player_name] == player_search
       return player[:points]
     end 
   end 
 end 
end 


def shoe_size(name)
 game_hash.each do |team,team_info|
   team_info[:players].each do |hash|
     if hash[:player_name] == name 
       return hash[:shoe]
     end 
   end 
 end 
end 

def team_colors(team_name)
  game_hash.each do |home_away, info|
      if info[:team_name] == team_name 
      return info[:colors]
      end 
  end 
end 
      
      
def team_names 
  names = []
  game_hash.each do |home_away, info|
    info.each do |attribute, value|
      if attribute == :team_name 
        names.push(value) 
      end 
    end
  end 
  names
end 
        

def player_numbers(name)
  jersey_list = []
  game_hash.each do |team, info|
      if info[:team_name] == name 
        info.each do |key, value|
          if key == :players 
            
            value.each do |final|
              num = final[:number]
              jersey_list.push(num)
            end 
          end 
        end 
      end 
    end 
    jersey_list
  end 
  
  
  def player_stats(name)
    game_hash.each do |location, value|
      value.each do |team_info, inner_value|
        if team_info == :players
          inner_value.each do |stats, values|
            if stats[:player_name] == name 
            return stats  
          end 
        end 
      end 
    end 
   end 
  end 
    


  def big_shoe_rebounds
    biggest_shoe = 0 
    rebounds = 0 
    game_hash.each do |location, properties|
      
      properties.each do |attribute, data|
      
        if attribute == :players 
          data.each do |key|
            if key[:shoe] > biggest_shoe
              biggest_shoe = key[:shoe]
              rebounds = key[:rebounds]
            end 
          end
        end
      end
    end
   return rebounds 
  end


    
    
    
    
    
    
   

    
    # largest shoe size 
    
    # return their number of rebounds 





# * Build a method, `big_shoe_rebounds`, that will return the number of rebounds
#   associated with the player that has the largest shoe size. Break this one down
#   into steps:

#   * First, find the player with the largest shoe size
#   * Then, return that player's number of rebounds
#   * Remember to think about return values here.

