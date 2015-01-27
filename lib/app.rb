class App

  attr_accessor :players, :team_one, :team_two, :available_players

  def initialize
    @players = []
    @available_players = []
    @team_one = []
    @team_two = []
  end

  def add_player(name)
    if @players.length >= 12
      raise "Too many players"
    elsif @players.include?(name)
      raise "#{name} is already in the system!"
    else
      @players << name
    end
  end

  def available(name)
    @available_players << name
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
