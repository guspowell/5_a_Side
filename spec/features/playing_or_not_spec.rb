require 'spec_helper'
require_relative '../../lib/app.rb'

feature 'Player chooses to play or not' do

  before(:each) do
    Player.create(:username => 'Pirlo')
    login('Pirlo')
  end


  scenario 'should see a question asking if player wants to play' do
    expect(page).to have_content('would you like to play this week?')
    expect(page).to have_button('YES')
    expect(page).to have_button('NO')
  end

  scenario 'should be able to click yes and be added to available players' do
    click_button 'YES'
    expect(page).to have_content("Pirlo")
  end

  scenario 'should not be able to add yourself twice' do
    click_button 'YES'
    click_button 'YES'
    expect(page).to have_content("You are already playing this week")

  end

  scenario 'should not be able to add yourself if there are twelve players already' do
    adding_different_players(15)
    expect(page).to have_content("Sorry, the game is full")
  end

end

def login(username)
  visit '/'
  fill_in :username_login, :with => username
  click_button 'Login'
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
