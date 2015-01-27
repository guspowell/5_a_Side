class App

  attr_accessor :players, :team_one, :team_two

  def initialize
    @players = []
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

  def generate_teams(number)
    players.shuffle!
    first_five = players[0..(number.to_i/2 -1)]
    first_five.each{|player| @team_one << player}
    second_five = players[(number.to_i/2)..number]
    second_five.each{|player| @team_two << player}
  end

  def reset_teams
    @team_one.clear
    @team_two.clear
  end

end
