require './lib/app'

describe App do

  let(:app){App.new}

  it 'should have two teams' do
    expect(app.teams).to eq 2
  end

  it 'should have an array of players' do
    expect(app.players).to eq []
  end

end
