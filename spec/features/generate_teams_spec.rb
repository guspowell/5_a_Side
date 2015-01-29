require 'spec_helper'
require_relative '../../lib/app.rb'

feature 'Generating two teams' do

  scenario 'With even number of players' do
    adding_different_players(6)
    expect(page).to have_selector('.available-players li', count: 6)
    click_button 'GENERATE'
    expect(page).to have_selector('.team1-box li', count: 3)
    expect(page).to have_selector('.team2-box li', count: 3)
  end

  # scenario 'will empty the available players list' do
  #   adding_different_players(6)
  #   click_button 'GENERATE'
  #   expect(page).to have_selector('.available-players li', count: 0)
  # end
end

def adding_different_players(num)
  i = 0
  while i < num do
    Player.create(:username => "#{i} rooney")
    visit ('/')
    login("#{i} rooney")
    click_button 'YES'
    i += 1
  end
end
