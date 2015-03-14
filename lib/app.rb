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
    if @available_players.include?(name) == false
      @available_players << name if @available_players.length < 12
    else
      @available_players.delete(name)
    end
  end

  def generate_teams(number = available_players.length)
    available_players_dup = @available_players.dup.shuffle!
      first_team = available_players_dup[0..(number/2 -1)]
      first_team.each{|player| @team_one << player if !@team_one.include?(player) && !@team_two.include?(player)} && @team_two.length >= @team_one.length
      second_team = available_players_dup[(number/2)..-1]
      second_team.each{|player| @team_two << player if !@team_one.include?(player) && !@team_two.include?(player)} && @team_one.length >= @team_two.length
  end

  def reset_teams
    @team_one.clear
    @team_two.clear
  end

  def reset_available_players
    @available_players.clear
    @team_one.clear
    @team_two.clear
  end

  def too_many_players?
    @available_players.length >= 12
  end
end
