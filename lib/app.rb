class App

  def initialize
    @players = []
  end

  def teams
    2
  end

  def players
    @players
  end

  def add_player(name)
    if @players.length >= 12
      raise "Too many players"
    else
      @players << name
    end
  end

end
