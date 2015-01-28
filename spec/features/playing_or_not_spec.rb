require 'spec_helper'

feature 'Player chooses to play or not' do

  before(:each) do
    Player.create(:username => 'Pirlo')
    login('Pirlo')
  end

  scenario 'should see a question asking if player wants to play' do
    expect(page).to have_content('Would you like to play this week?')
    expect(page).to have_button('YES')
    expect(page).to have_button('NO')
  end

  scenario 'should choose an option between two buttons' do
    click_button 'YES'
  end

end

def login(username)
  visit '/'
  fill_in :username_login, :with => username
  click_button 'submit-login'
end
