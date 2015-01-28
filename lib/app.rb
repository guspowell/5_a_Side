class App

  attr_accessor :players, :team_one, :team_two, :available_players

  def initialize
    @players = []
    @available_players = []
    @team_one = []
    @team_two = []
  end

  def add_player(name)
      @players << name
  end

  def available(name)
    if @available_players.length < 13
      @available_players << name
    else
      raise 'Too many players'
    end
  end

  def generate_teams(number = available_players.length)
    @available_players.shuffle!
      first_team = @available_players[0..(number/2 -1)]
      first_team.each{|player| @team_one << player}
      second_team = @available_players[(number/2)..-1]
      second_team.each{|player| @team_two << player}
  end

  def reset_teams
    @team_one.clear
    @team_two.clear
  end

end
