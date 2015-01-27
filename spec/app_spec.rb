require './lib/app'

describe App do

  let(:app){App.new}

  def add_twelve_players
    i = 0
      while i < 12 do
        app.add_player("#{i} rooney")
        i += 1
      end
  end

  it 'should have two teams' do
    expect(app.team_one).to eq []
    expect(app.team_two).to eq []
  end

  it 'should have an array of players' do
    expect(app.players).to eq []
  end

  context 'players' do

    it 'should be able to add players' do
      app.add_player('ronaldo')
      p @players.inspect
      expect(app.players[0]).to eq('ronaldo')
    end

    it 'should not be able to add more than 12 players' do
      add_twelve_players
      expect(lambda { app.add_player('pirlo') }).to raise_error(RuntimeError, "Too many players")
    end

    it 'cannot add the same player twice' do
      app.add_player('messi')
      expect(lambda { app.add_player('messi') }).to raise_error(RuntimeError, "messi is already in the system!")
    end
  end

  context 'teams' do

    it 'should create two teams with random players' do
      add_twelve_players
      app.generate_teams(12)
      expect(app.team_one.length).to eq (6)
      expect(app.team_two.length).to eq (6)
    end
  end

end
