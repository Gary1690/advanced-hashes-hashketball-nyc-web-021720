# Write your code here!
def game_hash

{
  :home =>{
      :team_name =>"Brooklyn Nets",
      :colors => ["Black", "White"],
      :players=>
      [
        {
        :player_name => "Alan Anderson",
        :number      => 0,
        :shoe        => 16,
        :points      => 22,
        :rebounds    => 12,
        :assists     => 12,
        :steals      => 3,
        :blocks      => 1,
        :slam_dunks  => 1
        },
        {
        :player_name => "Reggie Evans",
        :number      => 30,
        :shoe        => 14,
        :points      => 12,
        :rebounds    => 12,
        :assists     => 12,
        :steals      => 12,
        :blocks      => 12,
        :slam_dunks  => 7
        },
        {
        :player_name => "Brook Lopez",
        :number      => 11,
        :shoe        => 17,
        :points      => 17,
        :rebounds    => 19,
        :assists     => 10,
        :steals      => 3,
        :blocks      => 1,
        :slam_dunks  => 15
        },
        {
        :player_name => "Mason Plumlee",
        :number      => 1,
        :shoe        => 19,
        :points      => 26,
        :rebounds    => 11,
        :assists     => 6,
        :steals      => 3,
        :blocks      => 8,
        :slam_dunks  => 5
        },
        {
        :player_name => "Jason Terry",
        :number      => 31,
        :shoe        => 15,
        :points      => 19,
        :rebounds    => 2,
        :assists     => 2,
        :steals      => 4,
        :blocks      => 11,
        :slam_dunks  => 1
        }
      ]
  },
  :away=>{
    :team_name =>"Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players=>
    [
        {
        :player_name => "Jeff Adrien",
        :number      => 4,
        :shoe        => 18,
        :points      => 10,
        :rebounds    => 1,
        :assists     => 1,
        :steals      => 2,
        :blocks      => 7,
        :slam_dunks  => 2
        },
        {
        :player_name => "Bismack Biyombo",
        :number      => 0,
        :shoe        => 16,
        :points      => 12,
        :rebounds    => 4,
        :assists     => 7,
        :steals      => 22,
        :blocks      => 15,
        :slam_dunks  => 10
        },
        {
        :player_name => "DeSagna Diop",
        :number      => 2,
        :shoe        => 14,
        :points      => 24,
        :rebounds    => 12,
        :assists     => 12,
        :steals      => 4,
        :blocks      => 5,
        :slam_dunks  => 5
        },
        {
        :player_name => "Ben Gordon",
        :number      => 8,
        :shoe        => 15,
        :points      => 33,
        :rebounds    => 3,
        :assists     => 2,
        :steals      => 1,
        :blocks      => 1,
        :slam_dunks  => 0
        },
        {
        :player_name => "Kemba Walker",
        :number      => 33,
        :shoe        => 15,
        :points      => 6,
        :rebounds    => 12,
        :assists     => 12,
        :steals      => 7,
        :blocks      => 5,
        :slam_dunks  => 12
        }
    ]
  }
}
end

def num_points_scored(player_name)
  players = get_all_players(game_hash)
  player = players.find{|x| x[:player_name] == player_name }
  return player[:points] if player != nil
end

def shoe_size(player_name)
  players = get_all_players(game_hash)
  player = players.find{|x| x[:player_name] == player_name }
  return player[:shoe] if player != nil
end

def team_colors(team_name)
    teams = game_hash()
    return teams[:home][:colors] if teams[:home][:team_name] == team_name
    return teams[:away][:colors] if teams[:away][:team_name] == team_name
end

def team_names
    team_names = []
    game_hash.each { |key,value| team_names<<value[:team_name] }
    team_names
end

def player_numbers(team_name)
  players = get_all_players_from_a_team(game_hash,team_name)
  shirts_number =[]
  players.each { |player| shirts_number<< player[:number]  }
  shirts_number
end

def player_stats(player_name)
  players = get_all_players(game_hash)
  player = players.find{|x| x[:player_name] == player_name }
  stats = player.tap { |hs| hs.delete(:player_name) }
  stats
end

def big_shoe_rebounds
    players = get_all_players(game_hash)
    player = player_with_the_biggest_stat(players,:shoe)
    player[:rebounds]
end

def most_points_scored
    players = get_all_players(game_hash)
    player = player_with_the_biggest_stat(players,:points)
    player[:player_name]
end

def winning_team
  game_data = game_hash
  home_team_points = team_total_point(game_data[:home])
  away_team_points = team_total_point(game_data[:away])
  home_team_points > away_team_points ? game_data[:home][:team_name] : game_data[:away][:team_name]
end

def player_with_longest_name
players = get_all_players(game_hash)
current_longest_name =""
players.each do |player|
  if player[:player_name].length > current_longest_name.length
    current_longest_name = player[:player_name]
  end
end
current_longest_name
end

def long_name_steals_a_ton?
  players = get_all_players(game_hash)
  player_with_longest_name == player_with_the_biggest_stat(players,:steals)[:player_name]
end

def player_with_the_biggest_stat(players,stat)
  player_with_the_biggest_stat_found = {}
  biggest_stat_found = 0
  players.each do |player|
    if(player[stat] > biggest_stat_found)
      biggest_stat_found = player[stat]
      player_with_the_biggest_stat_found = player
    end
  end
  player_with_the_biggest_stat_found
end

def team_total_point(team)
  total_points = 0
  team[:players].each {|player| total_points+= player[:points]}
  total_points
end
def get_all_players (data)
  data[:home][:players] + data[:away][:players]
end

def get_all_players_from_a_team(data,team_name)
  return data[:home][:players] if data[:home][:team_name].include?(team_name)
  return data[:away][:players] if data[:away][:team_name].include?(team_name)
end
