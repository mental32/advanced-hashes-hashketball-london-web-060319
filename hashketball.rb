PLAYER_STAT_DATA = [:number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks]

def stats(*data)
  Hash[ *data.map.each_with_index { |value, index| [ PLAYER_STAT_DATA[index], value ] }.flatten ]
end

TEAM = {
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
      'DeSanga Diop' => stats(2, 14, 24, 12, 12, 4, 5, 5),
      'Ben Gordon' => stats(8, 15, 33, 3, 2, 1, 1, 0),
      'Brendan Haywood' => stats(33, 15, 6, 12, 12, 22, 5, 12)
    }
  }
}
