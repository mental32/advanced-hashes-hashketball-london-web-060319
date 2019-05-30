PLAYER_STAT_DATA = [:number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks]

def stats(*data)
  Hash[ *PLAYER_STAT_DATA.zip(data).flatten ]
end

GAME = {
  home: {
    team_name: 'Brooklyn Nets',
    colors: ['Black', 'White'],
    players: {
      'Alan Anderson' => stats(0, 16, 22, 12, 12, 3, 1, 1),
      'Reggie Evans' => stats(30, 14, 12, 12, 12, 12, 12, 7),
      'Brook Lopez' => stats(11, 17, 17, 19, 10, 3, 1, 15),
      'Mason Plumlee' => stats(1, 19, 26, 12, 6, 3, 8, 5),
      'Jason Terry' => stats(31, 15, 19, 2, 2, 4, 11, 1)
    }
  },

  away: {
    team_name: 'Charlotte Hornets',
    colors: ['Turquoise', 'Purple'],
    players: {
      'Jeff Adrien' => stats(4, 18, 10, 1, 1, 2, 7, 2),
      'Bismack Biyombo' => stats(0, 16, 12, 4, 7, 7, 15, 10),
      'DeSagna Diop' => stats(2, 14, 24, 12, 12, 4, 5, 5),
      'Ben Gordon' => stats(8, 15, 33, 3, 2, 1, 1, 0),
      'Brendan Haywood' => stats(33, 15, 6, 12, 12, 22, 5, 12)
    }
  }
}

require 'pp'


TEAMS = [GAME[:home], GAME[:away]]

PLAYERS = TEAMS.map { |team| team[:players] }.flatten.reduce({}, :merge)

def game_hash
  GAME
end

# * Build a method, `num_points_scored` that takes in an argument of a player's name and returns the number of points scored for that player.
#   * Think about where in the hash you will find a player's `:points`. How can you iterate down into that level? Think about the return value of your method. Remember that `.each` returns the original collection that you are iterating over. How can you return the number of points for a particular player?

def num_points_scored(name)
  PLAYERS[name][:points]
end

# * Build a method, `shoe_size`, that takes in an argument of a player's name and returns the shoe size for that player.
#   * Think about how you will find the shoe size of the correct player. How can you check and see if a player's name matches the name that has been passed into the method as an argument?

def shoe_size(name)
  PLAYERS[name][:shoe]
end

# * Build a method, `team_colors`, that takes in an argument of the team name and returns an array of that teams colors.

def team_colors(name)
  TEAMS.find { |team| team[:team_name] == name }[:colors]
end

# * Build a method, `team_names`, that operates on the game hash to return an array of the team names.

def team_names
  TEAMS.collect { |team| team[:team_name] }
end

# * Build a method, `player_numbers`, that takes in an argument of a team name and returns an array of the jersey number's for that team.

def player_numbers(name)
  TEAMS.find { |team| team[:team_name] == name }[:players].values.collect { |values| values[:number] }
end

# * Build a method, `player_stats`, that takes in an argument of a player's name and returns a hash of that player's stats.
#   * Check out the following example of the expected return value of the `player_stats` method:
#     ```bash
#     player_stats("Alan Anderson")
#     => { :number => 0,
#          :shoe => 16,
#          :points => 22,
#          :rebounds => 12,
#          :assists => 12,
#          :steals => 3,
#          :blocks => 1,
#          :slam_dunks => 1
#        }
#     ```

def player_stats(name)
  PLAYERS[name]
end

# * Build a method, `big_shoe_rebounds`, that will return the number of rebounds associated with the player that has the largest shoe size. Break this one down into steps:
#   * First, find the player with the largest shoe size
#   * Then, return that player's number of rebounds
#   * Remember to think about return values here. Use `binding.pry` to drop into your method and understand what it is returning and why.

def big_shoe_rebounds
  largest = nil

  for player in PLAYERS do
    shoe = player[:shoe]

    if largest == nil
      largest = player
    elsif shoe > largest[:shoe]
      largest = player
    end
  end

  largest[:rebounds]
end
