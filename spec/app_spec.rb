require './lib/app'

describe App do

  let(:app){App.new}

  it 'should have two teams' do
    expect(app.teams).to eq 2
  end

  it 'should have an array of players' do
    expect(app.players).to eq []
  end

  it 'should be able add players' do
    app.add_player('ronaldo')
    p @players.inspect
    expect(app.players[0]).to eq('ronaldo')
  end

  it 'should not be able to add more than 12 players' do
    12.times { app.add_player('rooney') }
    expect(lambda { app.add_player('pirlo') }).to raise_error(RuntimeError, "Too many players")
  end

end
