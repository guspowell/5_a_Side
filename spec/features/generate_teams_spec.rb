require 'spec_helper'
require_relative '../../lib/app.rb'
require 'helpers'

feature 'Generating two teams' do

  include Helpers

  scenario 'With even number of players' do
    adding_different_players_and_generate(6)
    expect(page).to have_selector('.left-col li', count: 6)
    click_button 'GENERATE'
    expect(page).to have_selector('.team1 li', count: 3)
    expect(page).to have_selector('.team2 li', count: 3)
  end
  
end
