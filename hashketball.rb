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

# Write code here

def num_points_scored(player)
  out="no player"
  x= game_hash[:home][:players]
  x.each do |playa|
      #this is where the players are listed and his stats
    out = playa[:points] if playa[:player_name]==player
      # playa.each do |key,value|
      #   puts "This is the key #{key} and this is the value #{value}"
      #   out=value if player=key
      # end
  end
   y= game_hash[:away][:players]
   y.each do |playa,stats|
     out = playa[:points] if playa[:player_name]==player
   end
  out
end

#p num_points_scored ("Kemba Walker")

def shoe_size(player)
  out="no player"
  x= game_hash[:home][:players]
  x.each do |playa|
      #this is where the players are listed and his stats
    out = playa[:shoe] if playa[:player_name]==player
      # playa.each do |key,value|
      #   puts "This is the key #{key} and this is the value #{value}"
      #   out=value if player=key
      # end
  end
   y= game_hash[:away][:players]
   y.each do |playa,stats|
     out = playa[:shoe] if playa[:player_name]==player
   end
  out
end
# p shoe_size ("Kemba Walker")

def team_colors (team)
  cala=[]
  game_hash.each do|status,information|
    # puts status[0]
    cala=information[:colors] if information[:team_name]==team
    # information.each do |cata,subinfo|
    #   puts :team_name[subinfo] if cata==:colors
    # end
  end
  cala
end

# p team_colors ("Charlotte Hornets")

def team_names
  cala=[]
  game_hash.each do |status,information|
    # puts status
    # puts information[:team_name]
    cala<< information[:team_name]
  end
  p cala
end

#team_names

def player_numbers (team)
  cala=[]
  if game_hash[:home][:team_name]==team
    x= game_hash[:home][:players]
    x.each do |playa,stats|
      cala<< playa[:number] if playa[:player_name].kind_of?String
    end
  elsif game_hash[:away][:team_name]==team
    y= game_hash[:away][:players]
    y.each do |playa,stats|
      cala<< playa[:number] if playa[:player_name].kind_of?String
    end
  else
    cala="Nothing to see here folks"
  end
  cala
end
# p player_numbers("Brooklyn Nets")
def player_stats (player)
  out={}
  x= game_hash[:home][:players]
  x.each do |playa|
    out = playa if playa[:player_name]==player
  end
  y= game_hash[:away][:players]
  y.each do |playa,stats|
    out = playa if playa[:player_name]==player
  end
  out
end
# p player_stats("Reggie Evans")

def big_shoe_rebounds
  shoe_size=0
  shoe_man_rebound=0
  x= game_hash[:home][:players]
  x.each do |playa|
    shoe_man_rebound=playa[:rebounds] if playa[:shoe]>shoe_size
    shoe_size = playa[:shoe] if playa[:shoe]>shoe_size
  end
  y= game_hash[:away][:players]
  x.each do |playa|
    shoe_man_rebound=playa[:rebounds] if playa[:shoe]>shoe_size
    shoe_size = playa[:shoe] if playa[:shoe]>shoe_size
  end
  shoe_man_rebound
end

p big_shoe_rebounds
