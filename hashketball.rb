# Write your code here!

def game_hash
  {
    :home => { :team_name => "Charlotte Hornets",
               :colors => ["Turquoise", "Purple"],
               :players => [
                 {:player_name => "Jeff Adrien",
                  :number => 4,
                  :shoe => 18,
                  :points => 10,
                  :rebounds => 1,
                  :assists => 1,
                  :steals => 2,
                  :blocks => 7,
                  :slam_dunks => 2
                 },
                 {:player_name => "Bismak Biyombo",
                  :number => 0,
                  :shoe => 16,
                  :points => 12,
                  :rebounds => 4,
                  :assists => 7,
                  :steals => 7,
                  :blocks => 15,
                  :slam_dunks => 10
                 },
                 {:player_name => "DeSagna Diop",
                  :number => 2,
                  :shoe => 14,
                  :points => 24,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 4,
                  :blocks => 5,
                  :slam_dunks => 5
                 },
                 {:player_name => "Ben Gordon",
                  :number => 8,
                  :shoe => 15,
                  :points => 33,
                  :rebounds => 3,
                  :assists => 2,
                  :steals => 1,
                  :blocks => 1,
                  :slam_dunks => 0
                 },
                 {:player_name => "Brendan Haywood",
                  :number => 33,
                  :shoe => 15,
                  :points => 6,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 22,
                  :blocks => 5,
                  :slam_dunks => 12
                 }
               ]
            },
    :away => { :team_name => "Brooklyn Nets",
               :colors => ["Black", "White"],
               :players => [
                 {:player_name => "Alan Anderson",
                  :number => 0,
                  :shoe => 16,
                  :points => 22,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 1
                 },
                 {:player_name => "Reggie Evans",
                  :number => 30,
                  :shoe => 14,
                  :points => 12,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 12,
                  :blocks => 12,
                  :slam_dunks => 7
                 },
                 {:player_name => "Brook Lopez",
                  :number => 11,
                  :shoe => 17,
                  :points => 17,
                  :rebounds => 19,
                  :assists => 10,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 15
                 },
                 {:player_name => "Mason Plumlee",
                  :number => 1,
                  :shoe => 19,
                  :points => 26,
                  :rebounds => 12,
                  :assists => 6,
                  :steals => 3,
                  :blocks => 8,
                  :slam_dunks => 5
                 },
                 {:player_name => "Jason Terry",
                  :number => 31,
                  :shoe => 15,
                  :points => 19,
                  :rebounds => 2,
                  :assists => 2,
                  :steals => 4,
                  :blocks => 11,
                  :slam_dunks => 1
                 }
               ]
    }
  }
end


def num_points_scored(player_name)
  points = nil 
  game_hash.each do |location, team_info|
    hash_of_players = team_info[:players] 
    hash_of_players.each do |player_info|
      if player_info[:player_name] == player_name
        points = player_info[:points]
      end 
    end
  end 
  points
end

def shoe_size(player_name)
  shoes = nil 
  game_hash.each do |location, team_info|
    hash_of_players = team_info[:players] 
    hash_of_players.each do |player_info|
      if player_info[:player_name] == player_name
        shoes = player_info[:shoe]
      end 
    end
  end 
  shoes
end

def team_colors(team)
  colors= []
  game_hash.each do |home_or_away, team_info|
    if team_info[:team_name] == team
      colors = team_info[:colors]
  # game_hash.each_with_object([]) do |home_or_away, team_info|
  #   if team_info[:team_name] == team
  #     team_info[:team_name]
    end
    end
colors
end



# def team_names
#   home = game_hash[:home][:team_name]
#   away = game_hash[:home][:team_name]
#  names = [home, away]
# end 

def team_names
  game_hash.collect do |home_or_away, team_info|
    team_info[:team_name]
  end
end

def player_numbers(team_name)
  # team_numbers= []
  game_hash.collect do |home_or_away, team_info|
    if team_info[:team_name] == team_name
      team_info[:players].collect do |player_info|
        player_info[:number]
    end
  end
end.flatten.compact
# team_numbers
end

def player_stats(player_name)
  # game_hash.collect do |home_or_away, team_info|
    # if team_info[:players][:player_name] == player_name
    #   team_info[:players][:player_name].delete[0]

    # team_info.collect do |home_or_away, team_info|
    #   team_info[:players].select do |player_info|
    #     player_info[:player_name] == player_name 
    #   end.flatten.shift

    stats = {}
    game_hash.each do |home_or_away, team_info|
      team_info[:players].each do |player_info|
        if player_info[:player_name] == player_name
          stats = player_info
        end
      end
  end
  stats.delete(:player_name)
  stats
end



def big_shoe_rebounds
  big_shoe_player_info = []
  game_hash.each do |home_or_away,team_info|
  big_shoe_player_info << team_info[:players].max_by do |stats|
   stats[:shoe]
  end
end 
if big_shoe_player_info[0][:shoe] > big_shoe_player_info[1][:shoe]
  big_shoe_player_info[0][:rebounds]
elsif big_shoe_player_info[0][:shoe] < big_shoe_player_info[1][:shoe]
  big_shoe_player_info[1][:rebounds]
else 
  puts "No player has the largest shoe size alone."

end
end























