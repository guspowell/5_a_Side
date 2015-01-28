require './lib/app'

describe App do

  let(:app){App.new}

  def add_and_available_players(num)
    i = 0
      while i < num do
        app.add_player("#{i} rooney")
        app.available("#{i} rooney")
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
      expect(app.players[0]).to eq('ronaldo')
    end

    it 'should not be able to add more than 12 players' do
      add_and_available_players(12)
      expect(lambda { app.add_player('pirlo') }).to raise_error(RuntimeError, "Too many players")
    end

    it 'cannot add the same player twice' do
      app.add_player('messi')
      expect(lambda { app.add_player('messi') }).to raise_error(RuntimeError, "messi is already in the system!")
    end

    it 'players can decide whether they are available or not' do
      expect(app.available_players.length).to eq 0
      app.add_player('ronaldo')
      app.available('ronaldo')
      expect(app.available_players.length).to eq 1
    end

  end

  context 'teams' do

    it 'should create two teams with random players' do
      add_and_available_players(12)
      app.generate_teams
      expect(app.team_one.length).to eq (6)
      expect(app.team_two.length).to eq (6)
    end

    it 'should create a team of 5 and 4 when there are 9 available players' do
      add_and_available_players(9)
      app.generate_teams
      expect(app.team_one.length).to eq 4
      expect(app.team_two.length).to eq 5
    end

  end

end
