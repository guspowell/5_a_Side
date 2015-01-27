class App

  attr_accessor :players

  def initialize
    @players = []
  end

  def teams
    2
  end

  def add_player(name)
    if @players.length >= 12
      raise "Too many players"
    elsif players.include?(name)
      raise "#{name} is already in the system!"
    else
      @players << name
    end
  end

end
