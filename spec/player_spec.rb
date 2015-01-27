require 'spec_helper'

describe Player do

  # testing database tables

  it 'should be created and retrieved from the database' do
    expect(Player.count).to eq 0
    # now we create a player
    Player.create(username: 'Ronaldo')
    expect(Player.count).to eq 1
    # we store the player in a variable
    player = Player.first
    expect(player.username).to eq 'Ronaldo'
    # deleting player
    player.destroy
    expect(Player.count).to eq 0
  end

end
