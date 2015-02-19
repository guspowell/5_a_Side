require 'spec_helper'
require_relative '../../lib/app.rb'
require 'helpers'

feature 'Player chooses to play or not' do

  include Helpers

  before(:each) do
    Player.create(:username => 'Pirlo')
    login('Pirlo')
  end

  scenario 'should be able to click yes and be added to available players' do
    click_button 'AVAILABLE'
    expect(page).to have_content("Pirlo")
  end

  scenario 'should not be able to add yourself if there are twelve players already' do
    click_button 'RESET'
    visit '/'
    click_button 'RESET'
    adding_different_players(14)
    expect(page).to have_content("Sorry, the game is full")
  end

  scenario 'should be able to click again to become unavailable' do
    click_button 'RESET'
    click_button 'AVAILABLE'
    expect(page).to have_selector('.left-col li', count: 1)
    click_button 'AVAILABLE'
    expect(page).to have_selector('.left-col li', count: 0)
  end

end
